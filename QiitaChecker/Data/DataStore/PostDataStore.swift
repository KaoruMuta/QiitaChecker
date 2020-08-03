//
//  PostDataStore.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/08/01.
//

import RxSwift

protocol PostDataStore {
    func fetchArticles() -> Single<[ItemResponse]>
    func fetchArticles(with tag: String) -> Single<[ItemResponse]>
}

struct PostDataStoreImpl: PostDataStore {
    func fetchArticles() -> Single<[ItemResponse]> {
        return APIClient.send(request: ItemRequest.get(tag: nil))
    }
    
    func fetchArticles(with tag: String) -> Single<[ItemResponse]> {
        return APIClient.send(request: ItemRequest.get(tag: ["query": "tag:\(tag)"]))
    }
}
