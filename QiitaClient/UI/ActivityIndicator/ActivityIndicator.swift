//
//  ActivityIndicator.swift
//  QiitaClient
//
//  Created by 堺雄之介 on 2019/10/06.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import SwiftUI
import UIKit

struct ActivityIndicator: UIViewRepresentable {
    @Binding var isLoading: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        if isLoading {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}
