//
//  BaseRequest.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/21.
//

import Alamofire

protocol BaseRequest: BaseAPI, URLRequestConvertible {
    var parameters: Parameters? { get }
    var encoding: URLEncoding { get }
}

extension BaseRequest {
    var encoding: URLEncoding {
        return .default
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = TimeInterval(30)

        if let params = parameters {
            urlRequest = try encoding.encode(urlRequest, with: params)
        }

        return urlRequest
    }
}
