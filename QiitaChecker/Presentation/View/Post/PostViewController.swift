//
//  LatestPostViewController.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/15.
//

import UIKit
import RxSwift
import RxCocoa

class PostViewController: UIViewController {
    
    @IBOutlet private weak var postListView: UITableView!
    
    private var viewModel: PostViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configure()
    }
    
    static func instantiate(viewModel: PostViewModel) -> UIViewController {
        let viewController = PostViewController.instantiate()
        viewController.viewModel = viewModel
        return viewController
    }
    
    private func configure() {
        postListView.register(cellType: PostCell.self)
        postListView.delegate = self
        postListView.dataSource = self
        bind()
    }
    
    private func bind() {
        viewModel?.fetchArticles()
    }
}

extension PostViewController: StoryboardInstantiatable {}

extension PostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
