//
//  TagRequest.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/08/02.
//

import Alamofire

enum TagRequest: BaseRequest {
    typealias Response = TagResponse
    
    case get
    
    var method: HTTPMethod {
        switch self {
        case .get:
            return .get
        }
    }
    
    var path: String {
        return APIConstants.fetchTags.path
    }
    
    var parameters: Parameters? {
        return [
            "per_page": 100,
            "sort": "count"
        ]
    }
}
