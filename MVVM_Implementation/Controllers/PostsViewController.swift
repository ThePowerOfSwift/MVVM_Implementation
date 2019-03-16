//
//  PostsViewController.swift
//  MVVM_Implementation
//
//  Created by Dmitry Lupich on 3/9/19.
//  Copyright © 2019 Dmitry Lupich. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var spinner: UIActivityIndicatorView!

    // MARK: - Properties

    let viewModel = PostsViewModel()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupViewModel()
        self.viewModel.loadPosts()
    }

    // MARK: - Methods

    private func setupView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(PostTableViewCell.self)
        self.tableView.rowHeight = 75.0
        self.showSpinner(false)
    }


    private func showSpinner(_ flag: Bool) {
        self.spinner.isHidden = !flag
        if flag {
            self.spinner.startAnimating()
        } else {
            self.spinner.stopAnimating()
        }
    }

    private func setupViewModel() {
        self.viewModel.reloadTable = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.tableView.reloadData()
        }

        self.viewModel.showSpinner = { [weak self] flag in
            guard let strongSelf = self else { return }
            strongSelf.showSpinner(flag)
        }
    }
}

// MARK: - TableView DataSource

extension PostsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as PostTableViewCell
        cell.fill(with: CellPost(with: self.viewModel.posts[indexPath.row]))
        return cell
    }
}

// MARK: - TableView Delegate

extension PostsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (self.viewModel.posts.count - 5) {
            self.viewModel.page += 1
        }
    }
}

