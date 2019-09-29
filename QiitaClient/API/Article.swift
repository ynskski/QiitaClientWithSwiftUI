//
//  Article.swift
//  QiitaClient
//
//  Created by 堺雄之介 on 2019/09/29.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import Foundation

struct Article: Decodable, Identifiable {
    var id: String
    var title: String
    var user: User
    
    struct User: Decodable {
        var name: String
    }
}
