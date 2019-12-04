//
//  IndividualSignUpViewController.swift
//  RoomEaze
//
//  Created by Isabelle Smyth on 11/17/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import UIKit

class IndividualSignUpViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var bio: UITextView!
    @IBOutlet weak var classYear: UISegmentedControl!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var campus: UISegmentedControl!
    var profile: Profile!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func nextPressed(_ sender: Any) {
        profile.campus = campus.titleForSegment(at: campus.selectedSegmentIndex)!
        profile.classY = classYear.selectedSegmentIndex
        profile.groupName = name.text!
        profile.pBio = bio.text
        profile.pSize = 1
        profile.pOpen = "0"
        profile.gender = gender.titleForSegment(at: gender.selectedSegmentIndex)!
        performSegue(withIdentifier: "IndividualDone", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! FirstViewController
        //let destination =  navigationController.viewControllers.first as! NextStepViewController
        profile.saveData { (status) in
            print(status)
        }
        destination.profile = profile
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
