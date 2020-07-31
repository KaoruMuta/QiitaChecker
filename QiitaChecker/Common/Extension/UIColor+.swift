//
//  UIColor+.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/08/01.
//

import UIKit

extension UIColor {
    static func constant(_ type: ColorType) -> UIColor {
        switch type {
        case .qiita:
            return ColorName.qiita.color
        }
    }
}

enum ColorType {
    case qiita
}
