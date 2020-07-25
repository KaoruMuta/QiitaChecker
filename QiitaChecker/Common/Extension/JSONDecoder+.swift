//
//  JSONDecoder+.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/21.
//

import UIKit

extension JSONDecoder {
    convenience init(type: JSONDecoder.KeyDecodingStrategy) {
        self.init()
        self.keyDecodingStrategy = type
    }
    
    static let decoder = JSONDecoder(type: .convertFromSnakeCase)
}
