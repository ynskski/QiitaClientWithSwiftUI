//
//  DetailView.swift
//  QiitaClient
//
//  Created by 堺雄之介 on 2019/09/29.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var url: String
    
    var body: some View {
        VStack {
            SafariView(url: URL(string: url)!)
                .edgesIgnoringSafeArea(.all)
        }
        
//        .navigationBarTitle(Text(url), displayMode: .inline)
//        VStack {
//            WebView(url: URL(string: url)!)
//            .edgesIgnoringSafeArea(.bottom)
//            .edgesIgnoringSafeArea(.top)
//        }
//        .navigationBarTitle(Text(url), displayMode: .inline)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "")
    }
}