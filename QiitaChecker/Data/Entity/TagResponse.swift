//
//  TagResponse.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/08/02.
//

import UIKit
import Alamofire

struct TagResponse: Codable {
    let iconUrl: String?
    let id: String?
    
    enum CodingKeys: String, CodingKey {
        case iconUrl = "icon_url"
        case id
    }
}
