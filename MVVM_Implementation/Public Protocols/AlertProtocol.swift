//
//  AlertProtocol.swift
//  MVVM_Implementation
//
//  Created by Dmitriy Lupych on 3/9/19.
//  Copyright © 2019 Dmitry Lupich. All rights reserved.
//

import Foundation
import UIKit

protocol AlertProtocol {
    func show(_ error: Error)
}

extension AlertProtocol where Self: UIViewController {
    func show(_ error: Error) {
        let title = "Error"
        let message = error.localizedDescription
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        self.present(alert,
                     animated: true,
                     completion: nil)
    }
}

extension UIViewController: AlertProtocol { }
