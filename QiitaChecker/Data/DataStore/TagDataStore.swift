//
//  TagDataStore.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/08/02.
//

import RxSwift
import RealmSwift

protocol TagDataStore {
    func fetchTags() -> Single<[TagResponse]>
    func manageTag(with tag: String)
}

struct TagDataStoreImpl: TagDataStore {
    
    private let realm = try! Realm()
    
    func fetchTags() -> Single<[TagResponse]> {
        APIClient.send(request: TagRequest.get)
    }
    
    func manageTag(with tag: String) {
        let savedTags = realm.objects(SavedTag.self)
        let duplicatedTags = savedTags.filter({ $0.name == tag })
        if duplicatedTags.isEmpty {
            try! realm.write({
                let savedTag = SavedTag()
                savedTag.name = tag
                realm.add(savedTag)
            })
        } else {
            let deleteColumn = realm.objects(SavedTag.self).filter("name == '\(tag)'")
            try! realm.write({
                realm.delete(deleteColumn)
            })
        }
    }
}
