//
//  TagDataStore.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/08/02.
//

import RxSwift

protocol TagDataStore {
    func fetchTags() -> Single<[TagResponse]>
}

struct TagDataStoreImpl: TagDataStore {
    func fetchTags() -> Single<[TagResponse]> {
        APIClient.send(request: TagRequest.get)
    }
}
