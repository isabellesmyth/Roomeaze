//
//  Cell.swift
//  test4
//
//  Created by Isabelle Smyth on 11/4/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//


import UIKit


class Cell: UITableViewCell {
    
    @IBOutlet weak var bio: UITextView!
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var numberNeeded: UILabel!
    @IBOutlet weak var peopleNeeded: UILabel!
    
    @IBOutlet weak var cardView: UIView!
    
    struct People {
        var pBio: String
        var groupName: String
        var pImage: UIImage
        var pPNeeded: String
        var pPNum: String
    }
    var pArray = [People.init(pBio: "We love shopping!", groupName: "The Perfectionists", pImage: UIImage(named: "1")!, pPNeeded: "Spots Open:", pPNum: "2"), People.init(pBio: "Help us get an 8 man plz", groupName: "Bachelor Maniacs", pImage: UIImage(named: "2")!, pPNeeded: "Spots Open:", pPNum: "3"), People.init(pBio: "Looking for more people to join our housing group", groupName: "Newton's Community", pImage: UIImage(named: "3")!, pPNeeded: "Spots Open:", pPNum: "4"), People.init(pBio: "Looking to sublet 2 rooms for summer", groupName: "Cityside for Dayz", pImage: UIImage(named: "4")!, pPNeeded: "Spots Open:", pPNum: "3"), People.init(pBio: "Need SUBLETTERS FOR FALL", groupName: "Off CampusGs", pImage: UIImage(named: "7")!, pPNeeded: "Spots Open:", pPNum: "3"), People.init(pBio: "Looking for some girls to live with!", groupName: "Karen P.", pImage: UIImage(named: "5")!, pPNeeded: "", pPNum: "0"), People.init(pBio: "Join us!", groupName: "MacRats", pImage: UIImage(named: "6")!, pPNeeded: "Spots Open:", pPNum: "3"), People.init(pBio: "Don't wanna go final selection", groupName: "Sarah H.", pImage: UIImage(named: "8")!, pPNeeded: "", pPNum: "0") ]
   

}


extension UIView {
    func roundCorners(cornerRadius: Double) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
    }
    
}
