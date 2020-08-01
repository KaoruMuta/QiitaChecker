//
//  Request.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/21.
//

import Alamofire

enum ItemRequest: BaseRequest {
    typealias Response = ItemResponse
    
    case get
    
    var method: HTTPMethod {
        switch self {
        case .get:
            return .get
        }
    }
    
    var path: String {
        return APIConstants.fetchItem.path
    }
    
    var parameters: Parameters? {
        return nil
    }
}
