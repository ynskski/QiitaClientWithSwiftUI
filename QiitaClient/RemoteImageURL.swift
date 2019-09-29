//
//  RemoteImageURL.swift
//  QiitaClient
//
//  Created by 堺雄之介 on 2019/09/29.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import Foundation
import Combine
import UIKit

class RemoteImageURL: ObservableObject {
    @Published private(set) var image: UIImage = UIImage(systemName: "photo")!
    
    init(with imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let imageData = data,
                let remoteImage = UIImage(data: imageData) else { return }
            
            DispatchQueue.main.async {
                self.image = remoteImage
            }
        }.resume()
    }
    
}
