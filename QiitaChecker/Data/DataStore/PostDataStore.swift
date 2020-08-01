//
//  PostDataStore.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/08/01.
//

import RxSwift

protocol PostDataStore {
    func fetchArticles() -> Single<[ItemResponse]>
}

struct PostDataStoreImpl: PostDataStore {
    func fetchArticles() -> Single<[ItemResponse]> {
        return APIClient.send(request: ItemRequest.get)
    }
}
