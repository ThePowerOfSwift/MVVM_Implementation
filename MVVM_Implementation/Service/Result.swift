//
//  Result.swift
//  MVVM_Implementation
//
//  Created by Dmitriy Lupych on 3/9/19.
//  Copyright © 2019 Dmitry Lupich. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case faliture(Error)
}
