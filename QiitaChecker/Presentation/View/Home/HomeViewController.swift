//
//  HomeViewController.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/14.
//

import UIKit
import Parchment
import Floaty

protocol HomeView {}

final class HomeViewController: UIViewController {
    
    private var pageContents: [UIViewController] = []
    private var pageTitles = [L10n.latestPost]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePaging()
        configureFAB()
    }
    
    private func configurePaging() {
        let viewController = PostViewController.instantiate(viewModel: PostViewModel(useCase: DependencyManager.postUseCase))
        pageContents.append(viewController)
        
        let pagingViewController = PagingViewController(viewControllers: pageContents)
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
    
    private func configureFAB() {
        let floatingActionButton = Floaty()
        view.addSubview(floatingActionButton)
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
