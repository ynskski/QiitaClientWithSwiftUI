//
//  ProfileImageService.swift
//  QiitaClient
//
//  Created by 堺雄之介 on 2019/10/05.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import Foundation
import Combine
import UIKit

class ProfileImageService {
    func fetchProfileImage(url: URL) -> AnyPublisher<UIImage, Error> {
        let request = URLRequest(url: url)
        
        return URLSession.DataTaskPublisher(request: request, session: .shared)
            .tryMap { data, response in
                guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                    throw APIError.unknown
                }
                return UIImage(data: data)!
            }
            .mapError { error -> APIError in
                if let error = error as? APIError {
                    return error
                } else {
                    return APIError.apiError(reason: error.localizedDescription)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
