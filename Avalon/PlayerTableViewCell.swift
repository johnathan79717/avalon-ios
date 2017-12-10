//
//  PlayerTableViewCell.swift
//  Avalon
//
//  Created by Po-Hsiang Hao on 09/12/2017.
//  Copyright © 2017 Po-Hsiang Hao. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    @IBOutlet weak var playerNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
