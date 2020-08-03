//
//  HomeViewModel.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/08/03.
//

import RxSwift
import RxCocoa
import RxRealm

final class HomeViewModel {
    
    private let useCase: HomeUseCase
    
    var isLoading: BehaviorRelay<Bool> = .init(value: false)
    var savedTags: BehaviorRelay<[SavedTag]> = .init(value: [])
    
    private let disposeBag = DisposeBag()
    
    init(useCase: HomeUseCase) {
        self.useCase = useCase
    }
    
    func loadSavedTags() {
        let savedTags = useCase.loadSavedTags()
        Observable.array(from: savedTags)
            .subscribe(
                onNext: { [weak self] tags in
                    print(tags)
                    self?.savedTags.accept(tags)
                },
                onError: { [weak self] error in
                    print(error)
            })
            .disposed(by: disposeBag)
        
    }
}
