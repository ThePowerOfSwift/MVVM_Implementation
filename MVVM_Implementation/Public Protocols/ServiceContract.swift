//
//  ServiceContract.swift
//  MVVM_Implementation
//
//  Created by Dmitriy Lupych on 3/9/19.
//  Copyright © 2019 Dmitry Lupich. All rights reserved.
//

import Foundation

protocol ServiceContract {
    func loadPosts(page: Int, completion: @escaping (Result<Data>) -> Void)
}
