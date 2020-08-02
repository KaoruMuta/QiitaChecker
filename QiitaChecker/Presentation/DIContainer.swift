//
//  DependencyManager.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/15.
//

import Foundation

struct DIContainer {
    static let postUseCase: PostUseCase = {
        let dataStore = PostDataStoreImpl()
        let repository = PostRepositoryImpl(dataStore: dataStore)
        let translator = PostTranslatorImpl()
        return PostUseCaseImpl(repository: repository, translator: translator)
    }()
    
    static let tagUseCase: TagUseCase = {
        let dataStore = TagDataStoreImpl()
        let repository = TagRepositoryImpl(dataStore: dataStore)
        let translator = TagTranslatorImpl()
        return TagUseCaseImpl(repository: repository, translator: translator)
    }()
}
