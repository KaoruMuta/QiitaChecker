//
//  TagCell.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/08/02.
//

import UIKit
import Nuke

class TagCell: UICollectionViewCell {
    
    @IBOutlet private weak var icon: UIImageView!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var checkButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension TagCell {
    func configure(iconUrl: URL, id: String) {
        Nuke.loadImage(with: iconUrl, into: icon)
        name.text = id
    }
}

extension TagCell {
    func changeCheck(with state: Bool) {
        let backgroundImage = state ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "checkmark.circle")
        checkButton.setBackgroundImage(backgroundImage, for: .normal)
    }
}
