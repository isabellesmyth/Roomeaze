//
//  PreferencesViewController.swift
//  RoomEaze
//
//  Created by Isabelle Smyth on 11/25/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import UIKit

class PreferencesViewController: UIViewController {
    var profile: Profile!
    var filters: Filters!
    @IBOutlet weak var classYearFilter: UISegmentedControl!
    
    @IBOutlet weak var campusFilter: UISegmentedControl!
    @IBOutlet weak var genderFilter: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! FirstViewController
        destination.filter = filters
        profile.saveData { (status) in
            print(status)
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
