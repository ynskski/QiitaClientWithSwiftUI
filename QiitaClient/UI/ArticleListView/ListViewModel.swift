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
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        loadArticles()
    }
    
    func loadArticles() {
        let url = "https://qiita.com/api/v2/items"
        guard var urlComponents = URLComponents(string: url) else { return }
        urlComponents.queryItems = [
            URLQueryItem(name: "per_page", value: "50")
        ]
        
        ArticleService()
            .fetchArticle(url: urlComponents.url!)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }, receiveValue: { articles in
                    self.articles = articles
                }
            )
            .store(in: &cancellables)
    }
}