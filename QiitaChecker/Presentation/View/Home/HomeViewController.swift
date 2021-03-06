//
//  HomeViewController.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/14.
//

import UIKit
import Parchment
import RxSwift
import RxCocoa

final class HomeViewController: UIViewController {
    
    private var viewModel: HomeViewModel!
    private var pagingViewController: PagingViewController!
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configurePaging()
        bind()
    }
    
    private func configure() {
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.titleView = UIImageView(image: Asset.qiitaChecker.image)
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .add, target: nil, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .constant(.qiita)
        
        viewModel = HomeViewModel(useCase: DIContainer.homeUseCase)
        viewModel.loadSavedTags()
    }
    
    private func bind() {
        navigationItem.rightBarButtonItem?.rx.tap
            .subscribe(onNext: { [weak self] in
                let viewController = TagViewController.instantiate(viewModel: TagViewModel(useCase: DIContainer.tagUseCase))
                self?.navigationItem.backBarButtonItem = UIBarButtonItem(title: L10n.homeScreen, style: .plain, target: nil, action: nil)
                self?.navigationController?.pushViewController(viewController, animated: true)
            })
            .disposed(by: disposeBag)
        
        viewModel.allTags
            .subscribe(
                onNext: { [weak self] tags in
                    self?.pagingViewController.reloadData()
                },
                onError: { [weak self] error in
                    print(error)
            })
            .disposed(by: disposeBag)
    }
}

extension HomeViewController: PagingViewControllerDataSource {
    func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
        return viewModel.allTags.value.count
    }
    
    func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
        if index == 0 {
            return PostViewController.instantiate(viewModel: PostViewModel(useCase: DIContainer.postUseCase))
        } else {
            return PostViewController.instantiate(viewModel: PostViewModel(useCase: DIContainer.postUseCase), from: viewModel.allTags.value[index])
        }
    }
    
    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
        return PagingIndexItem(index: index, title: viewModel.allTags.value[index])
    }
}

private extension HomeViewController {
    private func configurePaging() {
        pagingViewController = PagingViewController(viewControllers: [])
        pagingViewController.selectedTextColor = .constant(.qiita)
        pagingViewController.indicatorColor = .constant(.qiita)
        pagingViewController.menuBackgroundColor = .dynamicColor(light: .white, dark: .black)
        pagingViewController.textColor = .dynamicColor(light: .black, dark: .white)
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            pagingViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pagingViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pagingViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pagingViewController.view.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        pagingViewController.dataSource = self
    }
}
