//
//  Article.swift
//  QiitaClient
//
//  Created by 堺雄之介 on 2019/09/29.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import Foundation

struct Article: Codable {
    var title: String
    var user: User
    
    struct User: Codable {
        var name: String
    }
}
