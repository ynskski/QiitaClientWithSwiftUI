//
//  APIClient.swift
//  QiitaClient
//
//  Created by 堺雄之介 on 2020/01/12.
//  Copyright © 2020 Yunosuke Sakai. All rights reserved.
//

import Foundation
import Combine

class QiitaAPI {
    private let baseURL = "https://qiita.com/api/v2/items"
    
    func fetchArticle(page: Int) -> AnyPublisher<[Article], Error> {
        var urlComponents = URLComponents(string: baseURL)!
        let items = [
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "per_page", value: "50")
        ]
        
        urlComponents.queryItems = items
        
        let request = URLRequest(url: urlComponents.url!)
        
        return URLSession.DataTaskPublisher(request: request, session: .shared)
            .tryMap { data, response in
                guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                    throw APIError.unknown
                }
                return data
            }
            .mapError { error -> APIError in
                if let error = error as? APIError {
                    return error
                } else {
                    return APIError.apiError(reason: error.localizedDescription)
                }
            }
            .decode(type: [Article].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
