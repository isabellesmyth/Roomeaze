//
//  Profile.swift
//  RoomEaze
//
//  Created by Isabelle Smyth on 11/14/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Profile: NSObject{
    var pBio: String
    var groupName: String
    var subletSpot: Int
    var pSize: Int
    var pOpen: String
    var postingUserID: String
    var documentID: String
    var campus: String
    var gender: String
    var classY: Int
    var Members: [String]
    var email: String
    var db: Firestore!
    var dictionary: [String: Any] {
        return ["pBio": pBio, "groupName": groupName, "subletSpot": subletSpot, "pSize": pSize, "pOpen": pOpen, "postingUserID": postingUserID, "documentID": documentID, "campus": campus, "gender": gender, "classY": classY, "members": Members, "email": email]
    }
    
    init(pBio: String, groupName: String, subletSpot: Int, pSize: Int, pOpen: String, postingUserID: String, documentID: String, campus: String, gender: String, classY: Int, members: [String], email: String) {
        self.pBio = pBio
        self.groupName = groupName
        self.subletSpot = subletSpot
        self.pSize = pSize
        self.pOpen = pOpen
        self.postingUserID = postingUserID
        self.documentID = documentID
        self.campus = campus
        self.gender = gender
        self.classY = classY
        self.Members = members
        self.email = email
    }
    convenience init(user: User){
        self.init(pBio: "", groupName: "", subletSpot: 1, pSize: 0, pOpen: "", postingUserID: "", documentID: "", campus: "Off", gender: "", classY: 0, members: [String](), email: user.email!)
    }
    convenience init(dictionary: [String: Any]) {
        let pBio = dictionary["pBio"] as! String? ?? ""
        let groupName = dictionary["groupName"] as! String? ?? ""
        //let pImage = dictionary["pImage"] as! String? ?? ""
        let pSize = dictionary["pSize"] as! Int? ?? 0
        let subletSpot = dictionary["subletSpot"] as! Int? ?? 1
        let pOpen = dictionary["pOpen"] as! String? ?? ""
        let postingUserID = dictionary["postingUserID"] as! String? ?? ""
        let campus = dictionary["campus"] as! String? ?? ""
        let classY = dictionary["classY"] as! Int? ?? 0
        let gender = dictionary["gender"] as! String? ?? ""
        let members = dictionary["members"] as! [String] ?? [""]
        let email = dictionary["email"]
        self.init(pBio: pBio, groupName: groupName, subletSpot: subletSpot, pSize: pSize, pOpen: pOpen, postingUserID: postingUserID, documentID: "", campus: campus, gender: gender, classY: classY, members: members, email: email as! String)
    }
    func loadData(currentUser: User,completed: @escaping () -> ()) {
//        db = Firestore.firestore()
//        let document = db.collection("users").document(self.email).self
//        let profile = Profile(dictionary: document.data())
//
//        completed()
        
        
       
    
    }
    func saveData(completed: @escaping (Bool) -> ()) {
        let db = Firestore.firestore()
        let storage = Storage.storage()
        guard let postingUserID = (Auth.auth().currentUser?.uid) else {
            print("***ERROR: could not save data because we do not have a valid posting user id")
            return completed(false)
        }
        //guard let photoData = UIImage(self.pImage).jpegData(compressionQuality: 0.5) else {
         //   print("*****ERROR: could not convert image to data format")
          //  return completed(false)
       // }
        //let storageRef = storage.reference().child(self.documentID)
        //let uploadTask = storageRef.putData(photoData)
        //documentUUID = UUID().uuidString
        self.postingUserID = postingUserID
        //create dict
        var dataToSave = self.dictionary
        //if we save record we will ahve doc id
        if self.documentID != "" {
            let ref = db.collection("users").document(self.documentID)
            ref.setData(dataToSave) { (error) in
                if let error = error {
                    print("***ERROR: updating document \(self.documentID) \(error.localizedDescription)")
                    completed(false)
                } else {
                    print("Document updated with doc id")
                    completed(true)
                }
                
            }
        } else {
            self.documentID = (Auth.auth().currentUser!.uid)
            dataToSave = self.dictionary
            var ref: DocumentReference? = nil
            db.collection("users").document((Auth.auth().currentUser?.email)!).setData(dataToSave) { error in
                if let error = error {
                    print("***ERROR: creating document \(self.documentID) \(error.localizedDescription)")
                    completed(false)
                } else {
                    print("Document created with doc id")
                    self.documentID = (Auth.auth().currentUser?.email)!
                    completed(true)
                }
                
            }
        }
        
    }
    
//
//    func saveIfNewUser(){
//        print("save if new user called")
//        let db = Firestore.firestore()
//        print("Firestore init")
//        let userRef = db.collection("users").document((Auth.auth().currentUser?.email)!)
//        print("User ref created")
//        userRef.getDocument { (document, error) in
//            guard error == nil else {
//                print("error: could not access document")
//                return
//            }
//            guard document?.exists == false else {
//                print("^^^the document for user already exists, no need to create new one.")
//                return
//            }
//            self.saveData()
//        }
//    }
//
//    func saveData(){
//        let db = Firestore.firestore()
//        let dataToSave: [String: Any] = self.dictionary
//        db.collection("users").document((Auth.auth().currentUser?.email)!).setData(dataToSave) { error in
//            if let error = error {
//                print("****ERROR \(error.localizedDescription) could not save data")
//            }
//        }
//    }
    
    
    
    func deleteData(completed: @escaping (Bool) -> ()){
        let db = Firestore.firestore()
        db.collection("users").document((Auth.auth().currentUser?.email)!).delete()
            {error in
                if let error = error {
                    print("🥵🥵🥵🥵Error deleting review documentid \(self.documentID) \(error.localizedDescription)")
                    completed(false)
                }
                else {

                    completed(true)
                }
        }
        
    }
}
