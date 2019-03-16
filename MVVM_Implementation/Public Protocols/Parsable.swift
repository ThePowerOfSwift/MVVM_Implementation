//
//  Parsable.swift
//  MVVM_Implementation
//
//  Created by Dmitriy Lupych on 3/9/19.
//  Copyright © 2019 Dmitry Lupich. All rights reserved.
//

import Foundation

protocol Parsable {
    associatedtype ValueType: Decodable
    static func mapArray(with anyData: Any) -> [ValueType]
}

extension Parsable {

    static func mapArray(with anyData: Any) -> [ValueType] {
        guard let data = anyData as? Data else { return [] }
        let decoder = JSONDecoder()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        //let dateOfTypeDate = dateFormatter.date(from: dateString)
        dateFormatter.locale = Locale(identifier: "ru_UA")

        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        let result = try? decoder.decode([ValueType].self, from: data)
        return result ?? [ValueType]()
    }
}
