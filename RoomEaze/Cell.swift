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

       
    


}


extension UIView {
    func roundCorners(cornerRadius: Double) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
    }
    
}
