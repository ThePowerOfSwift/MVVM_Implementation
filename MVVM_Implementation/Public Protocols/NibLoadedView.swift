//
//  NibLoadedView.swift
//  MVVM_Implementation
//
//  Created by Dmitriy Lupych on 3/16/19.
//  Copyright © 2019 Dmitry Lupich. All rights reserved.
//

import Foundation
import UIKit

protocol NibLoadableView: class { }

extension NibLoadableView where Self: UIView {

    static var nibName: String {
        return String(describing: self)
    }

}

extension UITableViewCell: NibLoadableView { }
