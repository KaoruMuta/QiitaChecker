//
//  DependencyManager.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/15.
//

import Foundation

struct DependencyManager {
    static let postUseCase: PostUseCase = {
        let repository = PostRepositoryImpl()
        let translator = PostTranslatorImpl()
        return PostUseCaseImpl(repository: repository, translator: translator)
    }()
}