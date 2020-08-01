//
//  PostUseCase.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/15.
//

import RxSwift

protocol PostUseCase {
    func fetchArticles() -> Single<[Post]>
}

final class PostUseCaseImpl: PostUseCase {
    
    private let repository: PostRepository
    private let translator: PostTranslator
    
    init(repository: PostRepository, translator: PostTranslator) {
        self.repository = repository
        self.translator = translator
    }
    
    func fetchArticles() -> Single<[Post]> {
        repository.fetchArticles().map({ [unowned self] entity -> [Post] in
            return self.translator.translate(from: entity)
        })
    }
}
