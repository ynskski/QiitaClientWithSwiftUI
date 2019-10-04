//
//  RemoteImageURL.swift
//  QiitaClient
//
//  Created by 堺雄之介 on 2019/09/29.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import Combine
import UIKit

class ProfileImageViewModel: ObservableObject {
    @Published private(set) var image: UIImage = UIImage(systemName: "photo")!
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(imageURL: String) {
        loadProfileImage(imageURL: imageURL)
    }
    
    func loadProfileImage(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        
        ProfileImageService()
            .fetchProfileImage(url: url)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }, receiveValue: { image in
                    self.image = image
                }
            )
            .store(in: &cancellables)
    }
    
}
