//
//  LoadingProtocol.swift
//  MVVM_Implementation
//
//  Created by Dmitriy Lupych on 3/9/19.
//  Copyright © 2019 Dmitry Lupich. All rights reserved.
//

import Foundation
import UIKit

protocol LoadingProtocol {
    func showLoader()
    //func hideLoader()
}

extension LoadingProtocol where Self: UIViewController {
    func showLoader() {
        let shadowView = UIView(frame: self.view.frame)
        let spinner = UIActivityIndicatorView(frame: shadowView.frame)
        shadowView.addSubview(spinner)
        self.view.addSubview(shadowView)
        spinner.startAnimating()
    }
}

extension UIViewController: LoadingProtocol { }
