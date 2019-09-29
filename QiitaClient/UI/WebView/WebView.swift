//
//  WebView.swift
//  QiitaClient
//
//  Created by 堺雄之介 on 2019/09/29.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        return WKWebView(frame: .zero)
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: URL(string: "")!)
    }
}
