//
//  APIConstants.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/18.
//

import Foundation

enum APIConstants {
    case fetchItem
    
    public var path: String {
        switch self {
        case .fetchItem:
            return "/items"
        }
    }
    
    public static var baseURL = "https://qiita.com/api/v2"
}
