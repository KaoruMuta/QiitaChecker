//
//  ItemResponse.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/21.
//

import UIKit
import Alamofire

struct ItemResponse: Codable {
    let user: User
    let title: String?
    let createdTime: String?
    
    enum CodingKeys: String, CodingKey {
        case user
        case title
        case createdTime = "created_at"
    }
}

struct User: Codable {
    let profileImageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case profileImageUrl = "profile_image_url"
    }
}
