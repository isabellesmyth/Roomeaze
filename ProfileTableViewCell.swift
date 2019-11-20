//
//  ProfileTableViewCell.swift
//  RoomEaze
//
//  Created by Isabelle Smyth on 11/19/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bio: UITextView!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var numberNeeded: UILabel!
    @IBOutlet weak var gSize: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var offCampusLabel: UILabel!
    
    var profiles = Profiles()
    func configureCell(profile: Profile) {
        print("profiles configuring")
        bio.text! = profile.pBio
        groupName.text! = profile.groupName
        numberNeeded.text! = profile.pOpen
        groupImage.image = profile.pImage
        if profile.pSize > 1 {
            gSize.isHidden = false
            gSize.text = "Spots Open:"

        }
        if profile.pSize == 1 {
            gSize.isHidden = true
        }
        if profile.campus != 1 {
            offCampusLabel.isHidden = true
        }
        if profile.campus == 1 {
            offCampusLabel.isHidden = false
        }
    }
    }


extension UIView {
    func roundCorners(cornerRadius: Double) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
    }
        
}


