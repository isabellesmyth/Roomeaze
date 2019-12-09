//
//  FirstViewController.swift
//  Roomeaze
//
//  Created by Isabelle Smyth on 11/4/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseUI
import GoogleSignIn


class FirstViewController: UIViewController {
    
    var authUI: FUIAuth!
    @IBOutlet weak var tableView: UITableView!
    var profiles: Profiles!
    var profile: Profile!
    var filter: Filters!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
        profiles = Profiles()
        filter = Filters(classYear: 0, gender: 2, campus: 2, groupSize: 0, spotsOpen: 0)
 //       tableView.delegate = self
   //     tableView.dataSource = self
        authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        
//        let tabBar = tabBarController as! TabBarController
    //    tabBar.profile = self.profile
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        profiles.loadData {
            self.filterProfiles()
            print("gender being filtered \(self.filter.gender)")
            self.tableView.reloadData()
        }
        checkIfNew()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      //  let tabbar = tabBarController as! TabBarController
       // tabbar.profile = self.profile
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        signIn()
        
    }
    
    @IBAction func signOutPressed(_ sender: Any) {
        do {
            try authUI!.signOut()
            print("^^^^Successfully Signed Out")
            tableView.isHidden = true
            
        }
        catch {
            tableView.isHidden = true
            print("Error: couldn't sign out")
        }
        signIn()
        //        let db = Firestore.firestore()
        //        let userRef = db.collection("users").document()
        //        userRef.getDocument { (document, error) in
        //            guard error == nil else {
        //                print("error: could not access document")
        //                return
        //            }
        //            guard document?.exists == true else {
        //                performSegue(withIdentifier: "NewUser", sender: nil)
        //                print("^^^the document for user already exists, no need to create new one.")
        //                return
        //            }
        //        }
    }
    
    
    
    
    func signIn() {
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth()
        ]
        let currentUser = authUI.auth?.currentUser
        if currentUser == nil {
            print("No current user")
            self.authUI?.providers = providers
            present(authUI.authViewController(), animated: true, completion: nil)
            
            
        } else {
            print("Current user")
            //profile = Profile(user: currentUser!)
            tableView.isHidden = false
            transferData()
            checkIfNew()
            // profile.saveData { (status) in
            //    print(status)
            //}
        }
        
    }
    func transferData(){
        let currentUser = authUI.auth?.currentUser
        let db = Firestore.firestore()
        let docRef = db.collection("users").document((Auth.auth().currentUser?.email)!)
        docRef.getDocument { (document, error) in
            if let profile = document.flatMap({
                $0.data().flatMap({ (data) in
                    self.profile = Profile(dictionary: data)
                })
            }) {
               
            } else {
                print("Document does not exist")
            }
        }
    }
    func checkIfNew(){
        let currentUser = authUI.auth?.currentUser
        let db = Firestore.firestore()
        print("curent user \(Auth.auth().currentUser?.email)")
        if currentUser != nil {
            let docRef = db.collection("users").document((Auth.auth().currentUser?.email)!)
            docRef.getDocument { (document, error) in
                if document!.exists == false{
                    self.performSegue(withIdentifier: "NewUser", sender: nil)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewUser" {
            let destination = segue.destination as! SignUpViewController
            destination.user = Auth.auth().currentUser!
        }
        
        if segue.identifier == "toFilters" {
            let destinationNavigationController = segue.destination as! UINavigationController
            let targetController = destinationNavigationController.topViewController as! FilterViewController
            targetController.filter = self.filter
            
        }
        

        
        if segue.identifier == "detailProfile" {
            let destination = segue.destination as! ProfileDetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.profile = profiles.profileArray[selectedIndexPath.row]
           // print(destination.profile)
    
        } else {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedIndexPath, animated: true)
            }
   
        }
        
        
    }
    
    @IBAction func unwindFromFilters(sender: UIStoryboardSegue) {
        print(" gender \(filter.gender)")
        print("unwindwing")
        viewWillAppear(true)
    }
    
    
    
    func filterProfiles(){
        
        switch filter.campus {
        case 0:
            profiles.profileArray = profiles.profileArray.filter{$0.campus == "On"}
        case 1:
            profiles.profileArray = profiles.profileArray.filter{$0.campus == "Off"}
        case 2:
            print()
        default:
            print()
        }
        switch filter.classYear {
        case 0:
            profiles.profileArray = profiles.profileArray
        case 1:
            profiles.profileArray = profiles.profileArray.filter{$0.classY == 0}
        case 2:
            profiles.profileArray = profiles.profileArray.filter{$0.classY == 1}
        case 3:
            profiles.profileArray = profiles.profileArray.filter{$0.classY == 2}
        case 4:
            profiles.profileArray = profiles.profileArray.filter{$0.classY == 3}
        default:
            print()
        }
        switch filter.gender {
            case 0:
                profiles.profileArray = profiles.profileArray.filter{$0.gender == "Female"}
            case 1:
                profiles.profileArray = profiles.profileArray.filter{$0.gender == "Male"}
        default:
            print()
        }
        switch filter.groupSize {
        case 0:
            profiles.profileArray = profiles.profileArray
        case 1:
            profiles.profileArray = profiles.profileArray.filter{$0.pSize == 1}
        case 2:
            profiles.profileArray = profiles.profileArray.filter{$0.pSize == 2}
        case 4:
            profiles.profileArray = profiles.profileArray.filter{$0.pSize == 3}
        case 5:
            profiles.profileArray = profiles.profileArray.filter{$0.pSize == 4}
        case 6:
            profiles.profileArray = profiles.profileArray.filter{$0.pSize >= 5}

        default:
            profiles.profileArray = profiles.profileArray
        }
        switch filter.spotsOpen {
        case 0:
            profiles.profileArray = profiles.profileArray
        case 1:
            profiles.profileArray = profiles.profileArray.filter{$0.pOpen == "1"}
        case 2:
            profiles.profileArray = profiles.profileArray.filter{$0.pOpen == "2"}
        case 4:
            profiles.profileArray = profiles.profileArray.filter{$0.pOpen == "3"}
        case 5:
            profiles.profileArray = profiles.profileArray.filter{$0.pOpen == "4"}
        case 6:
            profiles.profileArray = profiles.profileArray.filter{$0.pOpen >= "5"}

        default:
            profiles.profileArray = profiles.profileArray
        }

        
    }
       
    
    
}
extension FirstViewController: FUIAuthDelegate {
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
            self.tableView.isHidden = false
            checkIfNew()
            
        } else {
            signIn()
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

extension FirstViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.profileArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProfileTableViewCell
        cell.cardView.applyConfig(for: indexPath, numberOfCellsInSection: tableView.numberOfRows(inSection: indexPath.section))
        cell.configureCell(profile: profiles.profileArray[indexPath.row])
        
        cell.cardView.roundCorners(cornerRadius: 20.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}

extension UIView {
    func applyConfig(for indexPath: IndexPath, numberOfCellsInSection: Int) {
        switch indexPath.row {
        case numberOfCellsInSection - 1:
            // This is the case when the cell is last in the section,
            // so we round to bottom corners
            self.roundCorners(cornerRadius: 25)
            
            // However, if it's the only one, round all four
            if numberOfCellsInSection == 1 {
                self.roundCorners(cornerRadius: 25)
            }
            
        case 0:
            // If the cell is first in the section, round the top corners
            self.roundCorners(cornerRadius: 25)
            
        default:
            // If it's somewhere in the middle, round no corners
            self.roundCorners(cornerRadius: 25)
        }
    }
}



