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
    @Published var isFetching = false
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        loadArticles(page: 1)
    }
    
    func loadArticles(page: Int) {
        isFetching = true
        
        QiitaAPI()
            .fetchArticle(page: page)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
                self.isFetching = false
            }, receiveValue: { articles in
                self.articles = articles
            })
            .store(in: &cancellables)
    }
    
    func addArticles(page: Int) {
        let url = "https://qiita.com/api/v2/items"
        guard var urlComponents = URLComponents(string: url) else { return }
        urlComponents.queryItems = [
            URLQueryItem(name: "page", value: String(page)),
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
                }, receiveValue: { additionalArticles in
                    self.articles.append(contentsOf: additionalArticles)
                }
            )
            .store(in: &cancellables)
    }
}
