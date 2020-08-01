//
//  LatestPostViewController.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/15.
//

import UIKit
import RxSwift
import RxCocoa

final class PostViewController: UIViewController {
    
    @IBOutlet private weak var postListView: UITableView!
    
    private var viewModel: PostViewModel?
    private let disposeBag = DisposeBag()

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
        postListView.delegate = self
        postListView.register(cellType: PostCell.self)
        viewModel?.fetchArticles()
        bind()
    }
    
    private func bind() {
        viewModel?.postItems
            .bind(to: postListView.rx.items) { (tableView, row, item) in
                let cell = tableView.dequeueReusableCell(with: PostCell.self)
                cell.configure(with: item)
                return cell
        }
        .disposed(by: disposeBag)
        
        postListView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.postListView.deselectRow(at: indexPath, animated: true)
                guard let postItem = self?.viewModel?.postItems.value[indexPath.row] else { return }
                let safariViewController = SafariViewController(url: postItem.articleUrl)
                self?.present(safariViewController, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
}

extension PostViewController: StoryboardInstantiatable {}

extension PostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
