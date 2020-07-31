//
//  PostItemTranslator.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/29.
//

import Foundation

protocol PostTranslator {
    func translate(from entity: [ItemResponse]) -> [Post]
}

struct PostTranslatorImpl: PostTranslator {
    func translate(from entity: [ItemResponse]) -> [Post] {
        entity.map({
            let title = $0.title ?? ""
            let date = $0.createdTime ?? ""
            let profileImageURL = URL(string: $0.user.profileImageUrl ?? "https://qiita.com")!
            
            return Post(title: title, date: date, url: profileImageURL)
        })
    }
}
