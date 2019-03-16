//
//  Endpoint.swift
//  MVVM_Implementation
//
//  Created by Dmitriy Lupych on 3/9/19.
//  Copyright © 2019 Dmitry Lupich. All rights reserved.
//

import Foundation

enum Endpoint: String {

    private static let baseURL = "https://keddr.com/wp-json/wp/v2/posts"

    case page = "/?page="

    var path: String {
        switch self {
        case .page: return Endpoint.baseURL + self.rawValue
        }
    }
}

