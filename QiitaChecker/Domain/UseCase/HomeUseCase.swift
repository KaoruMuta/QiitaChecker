//
//  HomeUseCase.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/08/03.
//

import RealmSwift

protocol HomeUseCase {
    func loadSavedTags() -> Results<SavedTag>
}

final class HomeUseCaseImpl: HomeUseCase {
    
    private let repository: HomeRepository
    private let translator: HomeTranslator
    
    init(repository: HomeRepository, translator: HomeTranslator) {
        self.repository = repository
        self.translator = translator
    }
    
    func loadSavedTags() -> Results<SavedTag> {
        repository.loadSavedTags()
    }
}
