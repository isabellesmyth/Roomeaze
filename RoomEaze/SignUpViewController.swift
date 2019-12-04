//
//  SignUpViewController.swift
//  
//
//  Created by Isabelle Smyth on 12/3/19.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    var profile: Profile!
    var user: User!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Individual"{
            let destination = segue.destination as! IndividualSignUpViewController
            destination.profile = Profile(user: user)
        }
        if segue.identifier == "Group" {
            let destination = segue.destination as! GroupSignUpViewController
            destination.profile = Profile(user: user)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
