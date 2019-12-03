//
//  GroupSignUpViewController.swift
//  RoomEaze
//
//  Created by Isabelle Smyth on 11/14/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import UIKit


class GroupSignUpViewController: UIViewController {

    
    
    @IBOutlet weak var groupName: UITextField!
    @IBOutlet weak var groupSize: UITextField!
    @IBOutlet weak var spotsOpen: UITextField!
    @IBOutlet weak var groupBio: UITextView!
    @IBOutlet weak var classYear: UISegmentedControl!
    @IBOutlet weak var campus: UISegmentedControl!
    @IBOutlet weak var gender: UISegmentedControl!
    var profile: Profile!

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
            
    }
    @IBAction func nextButtonPressed(_ sender: Any) {
        profile.campus = campus.titleForSegment(at: campus.selectedSegmentIndex)!
        profile.classY = classYear.selectedSegmentIndex
        profile.groupName = groupName.text!
        profile.pBio = groupBio.text
        profile.pSize = Int(groupSize.text!)!
        profile.pOpen = spotsOpen.text!
        profile.gender = gender.titleForSegment(at: gender.selectedSegmentIndex)!
        performSegue(withIdentifier: "ToMembers", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! NextStepViewController
        //let destination =  navigationController.viewControllers.first as! NextStepViewController
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
