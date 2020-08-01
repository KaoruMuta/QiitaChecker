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
    
    static func background(_ type: ColorType) -> UIColor {
        switch type {
        case .qiita:
            return ColorName.qiita.color
        }
    }
    
    static func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        if #available(iOS 13, *) {
            return UIColor { traitCollection in
                traitCollection.userInterfaceStyle == .dark ? dark : light
            }
        } else {
            return light
        }
    }
}

enum ColorType {
    case qiita
}
