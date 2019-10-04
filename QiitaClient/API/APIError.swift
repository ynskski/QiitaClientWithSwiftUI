//
//  APIError.swift
//  QiitaClient
//
//  Created by 堺雄之介 on 2019/10/05.
//  Copyright © 2019 Yunosuke Sakai. All rights reserved.
//

import Foundation

enum APIError: Error, LocalizedError {
    case unknown, apiError(reason: String)

    var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown error"
        case .apiError(let reason):
            return reason
        }
    }
}
