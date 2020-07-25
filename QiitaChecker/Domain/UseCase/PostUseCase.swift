//
//  PostUseCase.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/15.
//

import RxSwift

protocol PostUseCase {
    func fetchArticles() -> Single<ItemResponse>
}

class PostUseCaseImpl: PostUseCase {
    
    private let repository: PostRepository
    
    init(repository: PostRepository) {
        self.repository = repository
    }
    
    func fetchArticles() -> Single<ItemResponse> {
        repository.fetchArticles()
    }
}
