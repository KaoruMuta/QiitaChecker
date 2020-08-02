//
//  TagRepository.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/08/02.
//

import RxSwift

protocol TagRepository {
    func fetchTags() -> Single<[TagResponse]>
}

final class TagRepositoryImpl: TagRepository {
    
    private let dataStore: TagDataStore
    
    init(dataStore: TagDataStore) {
        self.dataStore = dataStore
    }
    
    func fetchTags() -> Single<[TagResponse]> {
        return dataStore.fetchTags()
    }
}
