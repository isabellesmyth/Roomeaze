//
//  ProfileTableViewCell.swift
//  RoomEaze
//
//  Created by Isabelle Smyth on 11/14/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bio: UITextView!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var numberNeeded: UILabel!
    @IBOutlet weak var peopleNeeded: UILabel!
    @IBOutlet weak var cardView: UIView!
    var profile: Profile!
    func configureCell(profile: Profile) {
        
        bio.text = profile.pBio
        groupName.text = profile.groupName
        numberNeeded.text = profile.pSize
        peopleNeeded.text = profile.pOpen
        
    }
        


    }


extension UIView {
    func roundCorners(cornerRadius: Double) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
    }
        
}



