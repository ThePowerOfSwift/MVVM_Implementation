//
//  ReusableView.swift
//  MVVM_Implementation
//
//  Created by Dmitriy Lupych on 3/16/19.
//  Copyright © 2019 Dmitry Lupich. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableView: class { }

extension ReusableView where Self: UIView {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView { }
