//
//  MessageBoxTableViewCell.swift
//  RoomEaze
//
//  Created by Isabelle Smyth on 12/24/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import UIKit

class MessageBoxTableViewCell: UITableViewCell {

    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var unreadLabel: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
