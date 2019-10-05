//
//  ArticleRowView.swift
//  QiitaClient
//
//  Created by 堺雄之介 on 2019/10/03.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import SwiftUI

struct ArticleRowView: View {
    var article: Article
    
    var body: some View {
        HStack(alignment: .top) {
            ProfileImageView(imageURL: article.user.profileImageURL)
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .lineLimit(nil)
                
                HStack {
                    Text("by \(article.user.id)")
                        .font(.caption)
                    
                    Spacer()
                    
                    Text("\(article.likesCount)いいね")
                        .font(.caption)
                }
            }
        }
    }
}

struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRowView(article: Article(id: "0", title: "title", likesCount: 1, url: "http://test", user: Article.User(id: "1", name: "name", profileImageURL: "http://profile")))
    }
}
