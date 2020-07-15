//
//  LatestPostViewController.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/15.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet private weak var postListView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configure()
    }
    
    private func configure() {
        postListView.register(cellType: PostCell.self)
        postListView.delegate = self
        postListView.dataSource = self
    }
}

extension PostViewController: StoryboardInstantiatable {}

extension PostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
