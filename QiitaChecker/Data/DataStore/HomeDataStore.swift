//
//  HomeDataStore.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/08/03.
//

import RealmSwift

protocol HomeDataStore {
    func loadSavedTags() -> Results<SavedTag>
}

struct HomeDataStoreImpl: HomeDataStore {
    func loadSavedTags() -> Results<SavedTag> {
        let realm = try! Realm()
        let savedTags = realm.objects(SavedTag.self)
        return savedTags
    }
}
