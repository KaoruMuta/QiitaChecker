//
//  PostViewModel.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/15.
//

import RxSwift
import RxCocoa

final class PostViewModel {
    
    private let useCase: PostUseCase
    
    var isLoading: BehaviorRelay<Bool> = .init(value: false)
    var postItems: BehaviorRelay<[Post]> = .init(value: [])
    
    private let disposeBag = DisposeBag()
    
    init(useCase: PostUseCase) {
        self.useCase = useCase
    }
    
    func fetchArticles() {
        isLoading.accept(true)
        useCase.fetchArticles()
            .subscribe(
                onSuccess: { [weak self] data in
                    self?.isLoading.accept(false)
                    self?.postItems.accept(data)
                },
                onFailure: { [weak self] error in
                    self?.isLoading.accept(false)
            })
            .disposed(by: disposeBag)
    }
    
    func fetchArticles(with tag: String) {
        isLoading.accept(true)
        useCase.fetchArticles(with: tag)
            .subscribe(
                onSuccess: { [weak self] data in
                    self?.isLoading.accept(false)
                    self?.postItems.accept(data)
                },
                onFailure: { [weak self] error in
                    self?.isLoading.accept(false)
            })
            .disposed(by: disposeBag)
    }
}
