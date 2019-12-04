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
        
        groupName.text! = profile.groupName
        numberNeeded.text! = profile.pOpen
        groupImage.image = UIImage(named: profile.pImage)
        if profile.pSize > 1 {
            gSize.isHidden = false
            numberNeeded.isHidden = false
            gSize.text = "People Needed:"
        }
        if profile.pSize == 1 {
            gSize.isHidden = true
            numberNeeded.isHidden = true
        }
        if profile.campus == "On" {
            offCampusLabel.isHidden = false
            offCampusLabel.backgroundColor = UIColor.yellow
            offCampusLabel.text = "On Campus"
            offCampusLabel.backgroundColor = #colorLiteral(red: 1, green: 0.7471169829, blue: 0.4791043401, alpha: 1)
        }
        if profile.campus == "Off" {
            offCampusLabel.isHidden = false
            offCampusLabel.text = "Off Campus"
            offCampusLabel.backgroundColor = #colorLiteral(red: 1, green: 0.4927495718, blue: 0.4916276932, alpha: 1)
        }
        if profile.campus == "Either" {
            offCampusLabel.isHidden = true
            
        }
    }
    }


extension UIView {
    func roundCorners(cornerRadius: Double) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
    }
        
}


