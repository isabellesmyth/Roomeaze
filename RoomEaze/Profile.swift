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
    var pSize: String
    var pOpen: String
    var postingUserID: String
    var documentID: String
    
    var dictionary: [String: Any] {
        return ["pBio": pBio, "groupName": groupName, "pImage": pImage, "pSize": pSize, "pOpen": pOpen, "postingUserID": postingUserID, "documentID": documentID]
    }
    init( pBio: String, groupName: String, pImage: UIImage, pSize: String, pOpen: String, postingUserID: String, documentID: String) {
        self.pBio = pBio
        self.groupName = groupName
        self.pImage = pImage
        self.pSize = pSize
        self.pOpen = pOpen
        self.postingUserID = postingUserID
        self.documentID = documentID
    }
    convenience override init(){
        self.init(pBio: "", groupName: "", pImage: UIImage(), pSize: "", pOpen: "", postingUserID: "", documentID: "")
        
    }
    convenience init(dictionary: [String: Any]) {
        let pBio = dictionary["pBio"] as! String? ?? ""
        let groupName = dictionary["groupName"] as! String? ?? ""
        let pImage = dictionary["pImage"] as! UIImage? ?? nil
        let pSize = dictionary["pSize"] as! String? ?? ""
        let pOpen = dictionary["pOpen"] as! String? ?? ""
        let postingUserID = dictionary["postingUserID"] as! String? ?? ""
        self.init(pBio: pBio, groupName: groupName, pImage: pImage!, pSize: pSize, pOpen: pOpen, postingUserID: postingUserID, documentID: "")
    }
}
