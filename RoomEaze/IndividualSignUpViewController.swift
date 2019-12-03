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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func nextPressed(_ sender: Any) {
        
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
