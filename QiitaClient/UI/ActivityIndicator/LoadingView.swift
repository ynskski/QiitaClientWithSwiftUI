//
//  LoadingView.swift
//  QiitaClient
//
//  Created by 堺雄之介 on 2020/01/12.
//  Copyright © 2020 Yunosuke Sakai. All rights reserved.
//

import SwiftUI

struct LoadingView<Content>: View where Content: View {
    var isShowing: Bool
    var content: () -> Content
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                self.content()
                    .disabled(self.isShowing)
                
                VStack {
                    ActivityIndicator(isLoading: .constant(true), style: .large)
                }
                    .frame(width: geometry.size.width / 3,
                           height: geometry.size.width / 3)
                    .background(Color.secondary.colorInvert())
                    .foregroundColor(Color.primary)
                    .cornerRadius(20)
                    .opacity(self.isShowing ? 1 : 0)
            }
        }
    }
}
