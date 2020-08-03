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
    func saveTag(with tag: String)
}

struct TagDataStoreImpl: TagDataStore {
    
    func fetchTags() -> Single<[TagResponse]> {
        APIClient.send(request: TagRequest.get)
    }
    
    func saveTag(with tag: String) {
        let realm = try! Realm()
        try! realm.write({
            let savedTag = SavedTag()
            savedTag.name = tag
            realm.add(savedTag)
        })
    }
}
