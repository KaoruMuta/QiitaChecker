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
