//
//  ImageViewContainer.swift
//  QiitaClient
//
//  Created by 堺雄之介 on 2019/09/29.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import SwiftUI

struct ProfileImageView: View {
    @ObservedObject var profileImageViewModel: ProfileImageViewModel
    
    init(imageURL: String) {
        profileImageViewModel = ProfileImageViewModel(with: imageURL)
    }
    
    var body: some View {
        Image(uiImage: profileImageViewModel.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40, height: 40)
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(imageURL: "")
    }
}
