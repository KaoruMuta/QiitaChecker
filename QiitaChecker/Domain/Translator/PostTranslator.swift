//
//  PostItemTranslator.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/29.
//

import Foundation

protocol PostTranslator {
    typealias Entity = ItemResponse
    typealias Model = Post
    
    func translate(from entity: [ItemResponse]) -> [Post]
}

struct PostTranslatorImpl: PostTranslator {
    func translate(from entity: [ItemResponse]) -> [Post] {
        entity.map({
            let title = $0.title ?? ""
            let lgtmCount = $0.likesCount ?? -1
            let lgtmText = lgtmCount == -1 ? "LGTM: Failed to load" : "LGTM: \(String(lgtmCount))"
            let articleUrl = URL(string: $0.url ?? "https://qiita.com")!
            let profileImageURL = URL(string: $0.user.profileImageUrl ?? "https://qiita.com")!
            
            return Post(title: title, lgtmCount: lgtmText, articleUrl: articleUrl, profileImageurl: profileImageURL)
        })
    }
}
