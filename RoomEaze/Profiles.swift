//
//  Profiles.swift
//  RoomEaze
//
//  Created by Isabelle Smyth on 11/14/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Profiles{
    var profileArray = [ Profile(pBio: "We love shopping!", groupName: "The Perfectionists", pImage: "1", pSize: 4 , pOpen: "2", postingUserID: "123", documentID: "123", campus: "On", gender: "F", classY: 2021, members: ["kayle"], email: "sfuhwen@gmail.com")]
    var db: Firestore!
    
    init(){
        db = Firestore.firestore()
   
    }
    func loadData(completed: @escaping () -> ()) {
        db.collection("users").addSnapshotListener{ (QuerySnapshot, error) in
            guard error == nil else {
                print("******ERROR: adding snapshot listener")
                return completed()
            }
            self.profileArray = []
            for document in QuerySnapshot!.documents {
                let profile = Profile(dictionary: document.data())
                profile.documentID = document.documentID
                self.profileArray.append(profile)
            }
            completed()
        }
    }
}

