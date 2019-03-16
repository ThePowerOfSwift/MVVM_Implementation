//
//  Post.swift
//  MVVM_Implementation
//
//  Created by Dmitriy Lupych on 3/9/19.
//  Copyright © 2019 Dmitry Lupich. All rights reserved.
//

import Foundation

extension Post: Equatable {
    static func ==(lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }
}

struct Post: Codable {
    let id: Int
    let title: TitleRendered
    let date: Date
    let content: Content

    enum CodingKeys: String, CodingKey {
        case title, date, id, content
    }
}

extension Post: Parsable {
    typealias ValueType = Post
}

struct Content: Codable {
    let rendered: String
}

struct TitleRendered: Codable {
    let title: String
    enum CodingKeys: String, CodingKey {
        case title = "rendered"
    }
}
