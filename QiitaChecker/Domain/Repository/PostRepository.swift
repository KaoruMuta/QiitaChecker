//
//  PostRepository.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/15.
//

import RxSwift

protocol PostRepository {
    func fetchArticles() -> Single<[ItemResponse]>
}

struct PostRepositoryImpl: PostRepository {
    func fetchArticles() -> Single<[ItemResponse]> {
        return APIClient.send(request: ItemRequest.get)
    }
}
