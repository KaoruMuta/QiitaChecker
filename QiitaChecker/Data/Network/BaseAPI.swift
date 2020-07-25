//
//  BaseAPI.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/21.
//

import Alamofire

protocol BaseAPI {
    associatedtype Response
    
    var method: HTTPMethod { get }
    var baseURL: URL { get }
    var path: String { get }
    var headers: HTTPHeaders? { get }
}

extension BaseAPI {
    var baseURL: URL {
        return try! APIConstants.baseURL.asURL()
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
