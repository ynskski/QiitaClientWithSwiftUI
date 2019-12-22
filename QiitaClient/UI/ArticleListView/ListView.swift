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
    @State var searchText = ""
    @State private var page = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Search", text: self.$searchText)
                        .keyboardType(.webSearch)
                }

                Section {
                    ForEach(self.viewModel.articles) { article in
                        ArticleRowView(article: article)
                            .onTapGesture {
                                self.showModal.toggle()
                                self.url = article.url
                            }
                            .padding(.vertical, 8)
                    }
                }
            }
            .navigationBarTitle(Text("New Articles"))
            .navigationBarItems(leading:
                Button(action: {
                    self.page = 1
                    self.viewModel.loadArticles(page: self.page)
                }, label: {
                    Text("Reload")
                }),
            trailing:
                Button(action: {
                    self.page += 1
                    self.viewModel.addArticles(page: self.page)
                }, label: {
                    Text("Next")
                })
            )
            .sheet(isPresented: $showModal) {
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
