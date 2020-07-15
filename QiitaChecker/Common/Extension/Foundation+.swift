//
//  Foundation+.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/15.
//

import Foundation

extension NSObject: ClassNameProtocol {}

protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

extension ClassNameProtocol {
    public static var className: String {
        String(describing: self)
    }

    public var className: String {
        Self.className
    }
}
