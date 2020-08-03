//
//  TagViewModel.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/08/02.
//

import RxSwift
import RxCocoa

final class TagViewModel {
    
    private let useCase: TagUseCase
    
    var isLoading: BehaviorRelay<Bool> = .init(value: false)
    var tags: BehaviorRelay<[Tag]> = .init(value: [])
    
    private let disposeBag = DisposeBag()
    
    init(useCase: TagUseCase) {
        self.useCase = useCase
    }
    
    func fetchTags() {
        isLoading.accept(true)
        useCase.fetchTags()
        .subscribe(
            onSuccess: { [weak self] tags in
                self?.tags.accept(tags)
                self?.isLoading.accept(false)
            },
            onError: { [weak self] error in
                self?.isLoading.accept(false)
        })
        .disposed(by: disposeBag)
    }
    
    func saveTag(with tag: String) {
        useCase.saveTag(with: tag)
    }
}
