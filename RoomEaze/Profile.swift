//
//  Profile.swift
//  RoomEaze
//
//  Created by Isabelle Smyth on 11/14/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import Foundation
import UIKit
class Profile: NSObject{
    var pBio: String
    var groupName: String
    var pImage: UIImage
    var pSize: Int
    var pOpen: String
    var postingUserID: String
    var documentID: String
    var campus: Int
    var gender: String
    var classY: Int
    var dictionary: [String: Any] {
        return ["pBio": pBio, "groupName": groupName, "pImage": pImage, "pSize": pSize, "pOpen": pOpen, "postingUserID": postingUserID, "documentID": documentID, "campus": campus, "gender": gender, "classY": classY]
    }
    init( pBio: String, groupName: String, pImage: UIImage, pSize: Int, pOpen: String, postingUserID: String, documentID: String, campus: Int, gender: String, classY: Int) {
        self.pBio = pBio
        self.groupName = groupName
        self.pImage = pImage
        self.pSize = pSize
        self.pOpen = pOpen
        self.postingUserID = postingUserID
        self.documentID = documentID
        self.campus = campus
        self.gender = gender
        self.classY = classY
    }
    convenience override init(){
        self.init(pBio: "", groupName: "", pImage: UIImage(), pSize: 0, pOpen: "", postingUserID: "", documentID: "", campus: 2, gender: "", classY: 0)
    }
    convenience init(dictionary: [String: Any]) {
        let pBio = dictionary["pBio"] as! String? ?? ""
        let groupName = dictionary["groupName"] as! String? ?? ""
        let pImage = dictionary["pImage"] as! UIImage? ?? nil
        let pSize = dictionary["pSize"] as! Int? ?? 0
        let pOpen = dictionary["pOpen"] as! String? ?? ""
        let postingUserID = dictionary["postingUserID"] as! String? ?? ""
        let campus = dictionary["campus"] as! Int? ?? 2
        let classY = dictionary["classY"] as! Int? ?? 0
        let gender = dictionary["gender"] as! String? ?? ""
        self.init(pBio: pBio, groupName: groupName, pImage: pImage!, pSize: pSize, pOpen: pOpen, postingUserID: postingUserID, documentID: "", campus: campus, gender: gender, classY: classY)
    }
}
