//
//  UIViewController+.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/15.
//

import UIKit

protocol StoryboardInstantiatable {
    static var storyboardName: String { get }
}

extension LatestPostViewController: StoryboardInstantiatable {}

extension StoryboardInstantiatable where Self: UIViewController {
    static var storyboardName: String {
        return String(describing: self)
    }

    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateInitialViewController() as! Self
    }
}
