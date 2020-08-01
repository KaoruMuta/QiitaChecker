//
//  SafariViewController.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/08/01.
//

import SafariServices

final class SafariViewController: SFSafariViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configure()
        super.viewWillAppear(animated)
    }
}

private extension SafariViewController {
    func configure() {
        preferredControlTintColor = .constant(.qiita)
    }
}
