//
//  TagViewController.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/08/02.
//

import UIKit
import RxSwift
import RxCocoa

final class TagViewController: UIViewController {
    
    @IBOutlet private weak var tagCollectionView: UICollectionView!
    
    private var viewModel: TagViewModel?
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configure()
        bind()
    }
    
    static func instantiate(viewModel: TagViewModel) -> UIViewController {
        let viewController = TagViewController.instantiate()
        viewController.viewModel = viewModel
        return viewController
    }
    
    private func configure() {
        tagCollectionView.delegate = self
        tagCollectionView.register(cellType: TagCell.self)
        navigationController?.title = L10n.tagList
        navigationItem.leftBarButtonItem?.title = "<"
        navigationItem.leftBarButtonItem?.tintColor = .constant(.qiita)
        
        viewModel?.fetchTags()
    }
    
    private func bind() {
        viewModel?.tags
            .bind(to: tagCollectionView.rx.items) { (collectionView, row, item) in
                let cell = collectionView.dequeueReusableCell(with: TagCell.self, for: IndexPath(row: row, section: 0))
                cell.configure(iconUrl: item.iconUrl, id: item.id)
                return cell
        }
        .disposed(by: disposeBag)
    }

}

extension TagViewController: StoryboardInstantiatable {}

extension TagViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
}
