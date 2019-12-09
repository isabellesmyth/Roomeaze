//
//  FilterViewController.swift
//  RoomEaze
//
//  Created by Isabelle Smyth on 11/14/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    
    @IBOutlet weak var groupSize: UISegmentedControl!
    @IBOutlet weak var spotsOpen: UISegmentedControl!
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var campus: UISegmentedControl!
    
    @IBOutlet weak var classY: UISegmentedControl!
    var filter: Filters!
    override func viewDidLoad() {
        super.viewDidLoad()
        campus.selectedSegmentIndex = filter.campus
        gender.selectedSegmentIndex = filter.gender
        groupSize.selectedSegmentIndex = filter.groupSize
        classY.selectedSegmentIndex = filter.classYear
        spotsOpen.selectedSegmentIndex = filter.spotsOpen
        
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! FirstViewController
        filter = Filters(classYear: classY.selectedSegmentIndex, gender: gender.selectedSegmentIndex, campus: campus.selectedSegmentIndex, groupSize: groupSize.selectedSegmentIndex, spotsOpen: spotsOpen.selectedSegmentIndex)
        destination.filter =  self.filter
        print(destination.filter.gender)
    }
    


    @IBAction func doneButtonPressed(_ sender: UIButton) {
        print("LEAVING")
        self.leaveViewController()
    }
    
    func leaveViewController() {
           let isPresentingInAddMode = presentingViewController is UINavigationController
                  if isPresentingInAddMode {
                      dismiss(animated: true, completion: nil)
                  } else {
                      navigationController?.popViewController(animated: true)
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
