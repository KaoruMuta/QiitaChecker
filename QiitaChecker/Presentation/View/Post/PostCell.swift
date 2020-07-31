//
//  PostCell.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/15.
//

import UIKit
import Nuke

class PostCell: UITableViewCell {
    
    @IBOutlet private weak var icon: UIImageView!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var lgtmCount: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PostCell {
    func configure(with postItem: Post) {
        Nuke.loadImage(with: postItem.url, into: icon)
        title.text = postItem.title
        lgtmCount.text = postItem.lgtmCount
    }
}
