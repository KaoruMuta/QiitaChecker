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

protocol HomeView {}

final class HomeViewController: UIViewController {
    
    private var pageContents: [UIViewController] = []
    private var pageTitles = [L10n.latestPost]
    private var viewModel: HomeViewModel?
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
        viewModel?.loadSavedTags()
    }
    
    private func bind() {
        navigationItem.rightBarButtonItem?.rx.tap
            .subscribe(onNext: { [weak self] in
                let viewController = TagViewController.instantiate(viewModel: TagViewModel(useCase: DIContainer.tagUseCase))
                self?.navigationItem.backBarButtonItem = UIBarButtonItem(title: L10n.homeScreen, style: .plain, target: nil, action: nil)
                self?.navigationController?.pushViewController(viewController, animated: true)
            })
            .disposed(by: disposeBag)
        
        viewModel?.savedTags
            .subscribe(
                onNext: { [weak self] tags in
                    print(tags)
                },
                onError: { [weak self] error in
                    print(error)
            })
            .disposed(by: disposeBag)
    }
}

extension HomeViewController: HomeView {}

extension HomeViewController: PagingViewControllerDataSource {
    func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
        return pageContents.count
    }
    
    func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
        return pageContents[index]
    }
    
    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
        return PagingIndexItem(index: index, title: pageTitles[index])
    }
}

private extension HomeViewController {
    private func configurePaging() {
        let viewController = PostViewController.instantiate(viewModel: PostViewModel(useCase: DIContainer.postUseCase))
        pageContents.append(viewController)
        
        let pagingViewController = PagingViewController(viewControllers: pageContents)
        pagingViewController.selectedTextColor = .constant(.qiita)
        pagingViewController.indicatorColor = .constant(.qiita)
        pagingViewController.menuBackgroundColor = .dynamicColor(light: .white, dark: .black)
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
