//
//  PostRepository.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/15.
//

import RxSwift

protocol PostRepository {
    func fetchArticles() -> Single<[ItemResponse]>
    func fetchArticles(with tag: String) -> Single<[ItemResponse]>
}

final class PostRepositoryImpl: PostRepository {
    
    private let dataStore: PostDataStore
    
    init(dataStore: PostDataStore) {
        self.dataStore = dataStore
    }
    
    func fetchArticles() -> Single<[ItemResponse]> {
        return dataStore.fetchArticles()
    }
    
    func fetchArticles(with tag: String) -> Single<[ItemResponse]> {
        return dataStore.fetchArticles(with: tag)
    }
}
