//
//  PostCell.swift
//  QiitaChecker
//
//  Created by k_muta on 2020/07/15.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var dateText: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
