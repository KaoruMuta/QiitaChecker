//
//  APIResult.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/21.
//

enum APIResult {
    case success(Codable)
    case failure(Error)
}
