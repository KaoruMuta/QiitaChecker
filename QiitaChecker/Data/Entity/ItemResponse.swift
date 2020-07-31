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
    let likesCount: Int?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case user
        case likesCount = "likes_count"
        case title
    }
}

struct User: Codable {
    let profileImageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case profileImageUrl = "profile_image_url"
    }
}
