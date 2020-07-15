//
//  UITableView+.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/15.
//

import UIKit

extension UITableView {
    func register(cellType: UITableViewCell.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }

    func register(cellTypes: [UITableViewCell.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }

    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
}
