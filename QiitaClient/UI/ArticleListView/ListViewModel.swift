//
//  ContentViewModel.swift
//  QiitaClient
//
//  Created by 堺雄之介 on 2019/09/29.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import Foundation
import Combine

class ListViewModel: ObservableObject {
    @Published var articles: [Article] = []
    
    init() {
        loadArticles()
    }
    
    func loadArticles() {
        let url = "https://qiita.com/api/v2/items"
        guard var urlComponents = URLComponents(string: url) else { return }
        urlComponents.queryItems = [
            URLQueryItem(name: "per_page", value: "50")
        ]
        
        ArticleService().fetchArticles(url: urlComponents.url!) { articles in
            if let articles = articles {
                self.articles = articles
            }
        }
//        URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
//            guard let jsonData = data else { return }
//
//            DispatchQueue.main.async {
//                do {
//                    self.articles = try JSONDecoder().decode([Article].self, from: jsonData)
//                } catch {
//                    print("client error: \(error.localizedDescription)")
//                }
//            }
//        }.resume()
    }
}
