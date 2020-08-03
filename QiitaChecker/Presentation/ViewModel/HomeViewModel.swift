//
//  HomeViewModel.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/08/03.
//

import UIKit
import RxSwift
import RxCocoa
import RxRealm

final class HomeViewModel {
    
    private let useCase: HomeUseCase
    
    var isLoading: BehaviorRelay<Bool> = .init(value: false)
    var allTags: BehaviorRelay<[String]> = .init(value: [L10n.latestPost])
    var allPageContents: BehaviorRelay<[UIViewController]> = .init(value: [])
    
    private let disposeBag = DisposeBag()
    
    init(useCase: HomeUseCase) {
        self.useCase = useCase
    }
    
    func loadSavedTags() {
        let savedTags = useCase.loadSavedTags()
        Observable.array(from: savedTags)
            .subscribe(
                onNext: { [weak self] tags in
                    guard let self = self else { return }
                    var currentTags = self.allTags.value
                    tags.forEach({
                        currentTags.append($0.name)
                    })
                    self.allTags.accept(currentTags)
                },
                onError: { [weak self] error in
                    print(error)
            })
            .disposed(by: disposeBag)
    }
}
