//
//  MessageListViewController.swift
//  RoomEaze
//
//  Created by Isabelle Smyth on 12/8/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import UIKit

import Firebase
import FirebaseUI
import FirebaseAuth

class MessageListViewController: UIViewController {
    var authUI: FUIAuth!
    @IBOutlet weak var tableView: UITableView!
    var chats: Chats!
    var profile: Profile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        print("messages view loaded")
        chats = Chats()
        
        
        // print(chatList)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            

        
        chats.loadChats {
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ChatViewController
        print("second screen user\(Auth.auth().currentUser?.email)")
        var db = Firestore.firestore()
        let selectedIndexPath = tableView.indexPathForSelectedRow!
        //let currentUser = chats.chatsArray[selectedIndexPath.row]
        for o in chats.chatsArray[selectedIndexPath.row].users{
          //  print("o is \(o)")
            if o != Auth.auth().currentUser?.email {
                var other = o
                destination.user2UID = o
            }
        }
        db.collection("users").addSnapshotListener{ (QuerySnapshot, error) in
        for document in QuerySnapshot!.documents {
            if document.documentID == destination.user2UID {
                self.profile = Profile(dictionary: document.data())
                destination.user2Name = self.profile.groupName
                print(self.profile.gender)
            }
        }
        }
    }
        
}


extension MessageListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.chatsArray.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var other = "help"
        for o in chats.chatsArray[indexPath.row].users{
            //print("o is \(o)")
            if o != Auth.auth().currentUser?.email {
                other = o
                cell.textLabel!.text = String(o)
                var db = Firestore.firestore()
                       db.collection("users").addSnapshotListener{ (QuerySnapshot, error) in
                       for document in QuerySnapshot!.documents {
                    
                           if document.documentID == other {
                               self.profile = Profile(dictionary: document.data())
                               cell.textLabel!.text = self.profile.groupName
                               print("yooooo\(cell.textLabel!.text)")
                           }
                       }
                       }
            }
        }
       
        
        return cell
    }
}

extension MessageListViewController: FUIAuthDelegate {
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
            return true
        }
        // other URL handling goes here.
        return false
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        // handle user and error as necessary
        print("*****authorization happening*****")
        if let user = user {
            
            
            
        } else {
            // signIn()
        }
    }
    
    func authPickerViewController(forAuthUI authUI: FUIAuth) -> FUIAuthPickerViewController {
        let loginViewController = FUIAuthPickerViewController(authUI: authUI)
        loginViewController.view.backgroundColor = UIColor.white
        loginViewController.modalPresentationStyle = .fullScreen
        let marginInsets: CGFloat = 16
        let imageHeight: CGFloat = 225
        let imageY = self.view.center.y - imageHeight
        let logoFrame = CGRect(x: self.view.frame.origin.x + marginInsets, y: imageY, width: self.view.frame.width - (marginInsets * 2), height: imageHeight)
        
        let logoImageView = UIImageView(frame: logoFrame)
        logoImageView.image = UIImage(named:"roomeazenobackground")
        logoImageView.contentMode = .scaleAspectFit
        loginViewController.view.addSubview(logoImageView)
        return loginViewController
    }
}
