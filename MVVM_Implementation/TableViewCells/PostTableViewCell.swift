//
//  PostTableViewCell.swift
//  MVVM_Implementation
//
//  Created by Dmitriy Lupych on 3/16/19.
//  Copyright © 2019 Dmitry Lupich. All rights reserved.
//

import UIKit

class CellPost {
    private let post: Post

    var title: String {
        return self.post.title.title
    }

    var date: String {
        return "Дата: " + self.post.date.toString()
    }

    init(with post: Post) {
        self.post = post
    }
}

class PostTableViewCell: UITableViewCell {

   // MARK: - Outlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    // MARK: - Methods

    func fill(with post: CellPost) {
        self.titleLabel.text = post.title
        self.dateLabel.text = post.date
    }
}
