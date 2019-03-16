//
//  PostsViewModel.swift
//  MVVM_Implementation
//
//  Created by Dmitriy Lupych on 3/9/19.
//  Copyright © 2019 Dmitry Lupich. All rights reserved.
//

import Foundation

class PostsViewModel {

    // MARK: - Properties

    var posts = [Post]()
    var page: Int = 1 {
        didSet {
            self.loadPosts()
        }
    }

    var reloadTable: (() -> Void)?
    var showSpinner: ((Bool) -> Void)?

    // MARK: - Methods

    func loadPosts() {
        self.showSpinner?(true)
        PostService.shared.loadPosts(page: self.page) {
            switch $0 {
            case .success(let data):
                let newPosts = Post.mapArray(with: data)
                self.posts += newPosts
                DispatchQueue.main.async {
                    self.showSpinner?(false)
                    self.reloadTable?()
                }
            case .faliture(let error): print(error)
            }
        }
    }
}
