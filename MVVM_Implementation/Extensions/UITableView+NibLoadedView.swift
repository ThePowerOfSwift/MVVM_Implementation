//
//  UITableView+NibLoadedView.swift
//  MVVM_Implementation
//
//  Created by Dmitriy Lupych on 3/16/19.
//  Copyright © 2019 Dmitry Lupich. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {

    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {

        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}
