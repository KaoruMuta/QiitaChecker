//
//  TagTranslator.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/08/02.
//

import Foundation

protocol TagTranslator {
    typealias Entity = TagResponse
    typealias Model = Tag
    
    func translate(from entity: [Entity]) -> [Model]
}

struct TagTranslatorImpl: TagTranslator {
    func translate(from entity: [TagResponse]) -> [Tag] {
        entity.map({
            let iconUrl = URL(string: $0.iconUrl ?? "https://qiita.com")!
            let name = $0.id ?? "failed to load"
            
            return Tag(iconUrl: iconUrl, name: name)
        })
    }
}
