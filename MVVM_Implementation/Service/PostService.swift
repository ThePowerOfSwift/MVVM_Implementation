//
//  PostService.swift
//  MVVM_Implementation
//
//  Created by Dmitriy Lupych on 3/9/19.
//  Copyright © 2019 Dmitry Lupich. All rights reserved.
//

import Foundation

final class PostService: ServiceContract {

    static let shared = PostService()
    private init() {}

    // MARK: - Load posts with pagination

    func loadPosts(page: Int, completion: @escaping (Result<Data>) -> Void) {

        guard let url = URL(string: Endpoint.page.path + String(page)) else { return }

        let task = URLSession.shared

        task.dataTask(with: url) { (data, _, error) in
            if let data = data   { completion(.success(data)) }
            if let error = error { completion(.faliture(error)) }
        }.resume()
    }
}
