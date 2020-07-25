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
    private let fetchDisposable = SerialDisposable()
    private let disposeBag = DisposeBag()
    
    init(useCase: PostUseCase) {
        self.useCase = useCase
    }
    
    private func configure() {
        fetchDisposable.disposed(by: disposeBag)
    }
    
    func fetchArticles() {
        fetchDisposable.disposable = useCase.fetchArticles()
            .subscribe(
                onSuccess: { [weak self] data in
                    print(data)
                },
                onError: { [weak self] error in
                    print(error)
            })
    }
}
