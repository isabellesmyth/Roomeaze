//
//  Chats.swift
//  RoomEaze
//
//  Created by Isabelle Smyth on 12/9/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import Foundation
import Firebase
import FirebaseUI
import FirebaseAuth

class Chats {
    var chatsArray = [Chat]()
    var db: Firestore!
    
    init (){
        db = Firestore.firestore()
        
    }
    func loadChats(completed: @escaping () -> ()) {
        //Fetch all the chats which has current user in it
        db.collection("Chats").whereField("users", arrayContains: Auth.auth().currentUser?.email ?? "Not Found User 1").addSnapshotListener{ (chatQuerySnap, error) in
            //                        for document in chatQuerySnap!.documents {
            //                            let chat = Chat(dictionary: document.data())
            //                             self.chatsArray.append(chat!)
            guard error == nil else {
                print("error!")
                return completed()
            }
            
        self.chatsArray = []
      //  print("getting docs")
        
        for doc in chatQuerySnap!.documents {
            print(doc.data())
            let chat = Chat(dictionary: doc.data())
            // doc.
            // let chat = Chat(dictionary: doc.d)
            //  print(chat?.dictionary)
            //print(" doc id is\(chat?.users)")
            self.chatsArray.append(chat!)
            
        }
        
            
        completed()
    

    }
    }


}
