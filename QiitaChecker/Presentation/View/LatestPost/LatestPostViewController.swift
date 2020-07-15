//
//  LatestPostViewController.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/15.
//

import UIKit

class LatestPostViewController: UIViewController {
    
    @IBOutlet private weak var postListView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configure()
    }
    
    private func configure() {
        postListView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
        postListView.delegate = self
        postListView.dataSource = self
    }
}

extension LatestPostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
