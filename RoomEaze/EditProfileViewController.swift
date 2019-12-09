//
//  EditProfileViewController.swift
//  RoomEaze
//
//  Created by Isabelle Smyth on 12/5/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
        
    @IBOutlet weak var memberButton: UIButton!
    
    @IBOutlet weak var groupSizeLabel: UILabel!
    @IBOutlet weak var groupSpotsLabel: UILabel!
    @IBOutlet weak var nextDoneButton: UIButton!
    @IBOutlet weak var groupName: UITextField!
        @IBOutlet weak var groupSize: UITextField!
        @IBOutlet weak var spotsOpen: UITextField!
        @IBOutlet weak var groupBio: UITextView!
        @IBOutlet weak var classYear: UISegmentedControl!
        @IBOutlet weak var campus: UISegmentedControl!
        @IBOutlet weak var gender: UISegmentedControl!
        var profile: Profile!
        var imagePicker = UIImagePickerController()
        var photo: UIImage!

        
        override func viewDidLoad() {
            super.viewDidLoad()
            
          
        }
    override func viewWillAppear(_ animated: Bool) {
        
        classYear.selectedSegmentIndex = profile.classY
         if profile.gender == "Female" {
             gender.selectedSegmentIndex = 0
         }
         if profile.gender == "Male" {
             gender.selectedSegmentIndex = 1
         }
         else {
             gender.selectedSegmentIndex = 2
         }
        print(nextDoneButton.titleLabel!.text)
        if profile.pSize == 1{
            memberButton.isHidden = true
            groupSize.isHidden = true
            spotsOpen.isHidden = true
            groupSpotsLabel.isHidden = true
            groupSizeLabel.isHidden = true
        }
        else {
            memberButton.isHidden = false
            groupSize.isHidden = false
            spotsOpen.isHidden = false
            groupSpotsLabel.isHidden = false
            groupSizeLabel.isHidden = false
        }
        groupName.text = profile.groupName
        if profile.gender == "Female" {
            gender.selectedSegmentIndex = 0
        }
        if profile.gender == "Male" {
            gender.selectedSegmentIndex = 1
        }
        else {
            gender.selectedSegmentIndex = 2
        }
        if profile.campus == "On" {
            campus.selectedSegmentIndex = 0
        }
        if profile.campus == "Off" {
            campus.selectedSegmentIndex = 1
        }
        else {
            campus.selectedSegmentIndex = 2
        }
        classYear.selectedSegmentIndex = profile.classY
        groupBio.text = profile.pBio
        groupSize.text = String(profile.pSize)
        spotsOpen.text = profile.pOpen
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
            if Int(groupSize.text!) == 1 {
                
                profile.campus = campus.titleForSegment(at: campus.selectedSegmentIndex)!
                profile.classY = classYear.selectedSegmentIndex
                profile.groupName = groupName.text!
                profile.pBio = groupBio.text
                
                profile.pOpen = spotsOpen.text!
                profile.gender = gender.titleForSegment(at: gender.selectedSegmentIndex)!
                performSegue(withIdentifier: "unwindFromIndividual", sender: nil)
             
            }
            else {
       
                profile.campus = campus.titleForSegment(at: campus.selectedSegmentIndex)!
                profile.classY = classYear.selectedSegmentIndex
                profile.groupName = groupName.text!
                profile.pBio = groupBio.text
                profile.gender = gender.titleForSegment(at: gender.selectedSegmentIndex)!
                //performSegue(withIdentifier: "unwindFromIndividual", sender: nil)
               
            }
    }
        func showAlert(title: String, message: String){
                  let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                  let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                  alertController.addAction(defaultAction)
                  present(alertController, animated: true, completion: nil)
              }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toMembers" {
                let destination = segue.destination as! EditMembersViewController
                destination.previousSize = profile.Members.count
                profile.pSize = Int(groupSize.text!)!
                destination.profile = profile
            } else {
                let destination = segue.destination as! SecondViewController
                destination.profile = profile
            }
            
        }


    @IBAction func addMemberButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toMembers", sender: nil)
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

