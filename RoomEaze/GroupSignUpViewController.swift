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
  //  var imagePicker = UIImagePickerController()
   // var photo: UIImage!
   // @IBOutlet weak var pickPhoto: UIButton!
    
    @IBOutlet weak var subletLabel: UILabel!
    @IBOutlet weak var subletSpots: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subletSpots.isHidden = true
        subletLabel.isHidden = true
            
    }
    
    @IBAction func offCampusIndicator(_ sender: Any) {
        if campus.selectedSegmentIndex == 1 {
            subletSpots.isHidden = false
            subletLabel.isHidden = false
        }
        else {
            subletSpots.isHidden = true
            subletLabel.isHidden = true
            subletSpots.selectedSegmentIndex = 1
        }
    }
    func showAlert(title: String, message: String){
           let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
           let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           alertController.addAction(defaultAction)
           present(alertController, animated: true, completion: nil)
       }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if (spotsOpen.text! == "") {
            showAlert(title: "Open Spots Is Empty", message: "You must enter a number how many people your group is looking for.")
            return
        }
        if (groupSize.text! == "") {
            showAlert(title: "Group Size Is Empty", message: "You must enter a number how many people are in your group.")
            return
        }
        profile.campus = campus.titleForSegment(at: campus.selectedSegmentIndex)!
        profile.classY = classYear.selectedSegmentIndex
        profile.groupName = groupName.text!
        profile.pBio = groupBio.text
        profile.pSize = Int(groupSize.text!)!
        profile.pOpen = spotsOpen.text!
        profile.gender = gender.titleForSegment(at: gender.selectedSegmentIndex)!
        profile.subletSpot = subletSpots.selectedSegmentIndex
        performSegue(withIdentifier: "ToMembers", sender: nil)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! NextStepViewController
        //let destination =  navigationController.viewControllers.first as! NextStepViewController
        destination.profile = profile
    }
    
    
    

    
    

    @IBAction func userTappedBackground(sender: AnyObject) {
      groupName.endEditing(true)
        groupBio.endEditing(true)
        groupSize.endEditing(true)
        spotsOpen.endEditing(true)
        
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

