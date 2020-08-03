//
//  HomeRepository.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/08/03.
//

import RealmSwift

protocol HomeRepository {
    func loadSavedTags() -> Results<SavedTag>
}

final class HomeRepositoryImpl: HomeRepository {
    
    private let dataStore: HomeDataStore
    
    init(dataStore: HomeDataStore) {
        self.dataStore = dataStore
    }
    
    func loadSavedTags() -> Results<SavedTag> {
        dataStore.loadSavedTags()
    }
}
