//
//  PostViewModel.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/15.
//

import RxSwift
import RxCocoa

class PostViewModel {
    
    private let useCase: PostUseCase
    
    var isLoading: BehaviorRelay<Bool> = .init(value: false)
    var postItems: BehaviorRelay<[Post]> = .init(value: [])
    
    private let fetchDisposable = SerialDisposable()
    private let disposeBag = DisposeBag()
    
    init(useCase: PostUseCase) {
        self.useCase = useCase
    }
    
    private func configure() {
        fetchDisposable.disposed(by: disposeBag)
    }
    
    func fetchArticles() {
        isLoading.accept(true)
        fetchDisposable.disposable = useCase.fetchArticles()
            .subscribe(
                onSuccess: { [weak self] data in
                    self?.isLoading.accept(false)
                    self?.postItems.accept(data)
                },
                onError: { [weak self] error in
                    self?.isLoading.accept(false)
            })
    }
}
