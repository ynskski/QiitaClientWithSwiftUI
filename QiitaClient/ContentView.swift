//
//  ContentView.swift
//  QiitaClient
//
//  Created by 堺雄之介 on 2019/09/21.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.articles) { article in
                HStack(alignment: .top) {
                    ImageViewContainer(imageURL: article.user.profileImageURL)
                    
                    VStack(alignment: .leading) {
                        Text(article.title)
                            .lineLimit(nil)
                        
                        Text("by \(article.user.id)")
                            .font(.caption)
                    }
                }
                .padding(.vertical, 8)
            }
            .navigationBarTitle(Text("New Articles"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
