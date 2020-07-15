//
//  UIViewController+.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/15.
//

import UIKit

enum StoryboardInstantiateType {
    case initial
    case identifier(String)
}

protocol StoryboardInstantiatable {
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle { get }
    static var instantiateType: StoryboardInstantiateType { get }
}

extension StoryboardInstantiatable where Self: NSObject {
    static var storyboardName: String {
        className
    }

    static var storyboardBundle: Bundle {
        Bundle(for: self)
    }

    private static var storyboard: UIStoryboard {
        UIStoryboard(name: storyboardName, bundle: storyboardBundle)
    }

    static var instantiateType: StoryboardInstantiateType {
        .identifier(className)
    }
}

extension StoryboardInstantiatable where Self: UIViewController {
    static func instantiate() -> Self {
        switch instantiateType {
        case .initial:
            return storyboard.instantiateInitialViewController() as! Self
        case .identifier(let identifier):
            return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
        }
    }
}
