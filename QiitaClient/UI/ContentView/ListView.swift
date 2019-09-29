//
//  ContentView.swift
//  QiitaClient
//
//  Created by 堺雄之介 on 2019/09/21.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel = ListViewModel()
    @State var showModal = false
    @State var url = ""
    
    var body: some View {
        NavigationView {
            List(viewModel.articles) { article in
                HStack(alignment: .top) {
                    ProfileImageView(imageURL: article.user.profileImageURL)
                    
                    VStack(alignment: .leading) {
                        Text(article.title)
                            .lineLimit(nil)
                        
                        Text("by \(article.user.id)")
                            .font(.caption)
                    }
                }
                .onTapGesture {
                    self.showModal.toggle()
                    self.url = article.url
                }
                .padding(.vertical, 8)
            }
            .navigationBarTitle(Text("New Articles"))
            .sheet(isPresented: $showModal) {
//                ArticleView(url: self.url)
                SafariView(url: URL(string: self.url)!)
                    .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}