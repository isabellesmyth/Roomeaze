//
//  NextStepViewController.swift
//  RoomEaze
//
//  Created by Isabelle Smyth on 11/14/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import UIKit

//set up a custom class for your cell
//IBoutlet weak var textinput

//access via ___.text
//keep track of the cell row
//use the section id (its jsut gonna be a number) to edit a local array of strings
//pass on the edited array of strings when you press next


class NextStepViewController: UIViewController {
    var profile: Profile!
    var cellSpacingHeight: CGFloat = 5
    @IBOutlet weak var membersTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        membersTableView.dataSource = self
        membersTableView.delegate = self
        // Do any additional setup after loading the view.
    }
   
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func nextButtonPressed(_ sender: UIButton) {
            print("next button was pressed")
            //dismiss(animated: false, completion: nil)
            saveThenSegue()
            
        }
    func saveThenSegue(){
        var members = [String]()
        for c in 0..<profile.pSize{
             let cell = membersTableView.cellForRow(at: [c,0]) as! MemberTableViewCell
             var memberAdd = cell.memberName.text!
             members.append(memberAdd)
         }
        profile.Members = members
        performSegue(withIdentifier: "GroupDone", sender: nil)
        
        profile.saveData { (status) in
            print(status)
        }
       
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
       // print(profile.Members)
        
       // profile.saveData { (status) in
          //  print(status)
       // }
        //print("addig profile \(profile.documentID)")
    }
}

extension NextStepViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath)
        print("index path \(indexPath) section \(indexPath.section)")
        cell.layer.cornerRadius = 8
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return profile.pSize
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
}
