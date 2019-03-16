//
//  Date+String.swift
//  MVVM_Implementation
//
//  Created by Dmitriy Lupych on 3/16/19.
//  Copyright © 2019 Dmitry Lupich. All rights reserved.
//

import Foundation

extension Date {

    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "ru_UA")
        dateFormatter.dateStyle = DateFormatter.Style.medium
        let stringDate = dateFormatter.string(from: self).lowercased()
        return stringDate
    }
}
