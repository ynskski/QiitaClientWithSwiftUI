//
//  ArticleService.swift
//  QiitaClient
//
//  Created by 堺雄之介 on 2019/10/04.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import Foundation

class ArticleService {
    func fetchArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            DispatchQueue.main.async {
                do {
                    let articles = try JSONDecoder().decode([Article].self, from: data)
                    completion(articles)
                } catch {
                    print("client error: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
