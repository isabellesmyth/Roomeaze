//
//  MemberTableViewCell.swift
//  RoomEaze
//
//  Created by Isabelle Smyth on 12/3/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import UIKit

class MemberTableViewCell: UITableViewCell {

    @IBOutlet weak var memberName: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
