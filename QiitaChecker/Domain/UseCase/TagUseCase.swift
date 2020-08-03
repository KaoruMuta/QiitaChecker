//
//  TagUseCase.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/08/02.
//

import RxSwift

protocol TagUseCase {
    func fetchTags() -> Single<[Tag]>
    func manageTag(with tag: String)
}

final class TagUseCaseImpl: TagUseCase {

    private let repository: TagRepository
    private let translator: TagTranslator
    
    init(repository: TagRepository, translator: TagTranslator) {
        self.repository = repository
        self.translator = translator
    }
    
    func fetchTags() -> Single<[Tag]> {
        repository.fetchTags().map({ [unowned self] entity -> [Tag] in
            return self.translator.translate(from: entity)
        })
    }
    
    func manageTag(with tag: String) {
        repository.manageTag(with: tag)
    }
}
