//
//  ProfileDetailViewController.swift
//  RoomEaze
//
//  Created by Isabelle Smyth on 11/25/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import UIKit

class ProfileDetailViewController: UIViewController {
    
    @IBOutlet weak var groupName: UILabel!
    
    @IBOutlet weak var bio: UITextView!
    
    @IBOutlet weak var members: UITableView!
    
    @IBOutlet weak var spotsOpen: UILabel!
    
    @IBOutlet weak var spotsOpenLabel: UILabel!
    @IBOutlet weak var groupSizeLabel: UILabel!
    @IBOutlet weak var gsize: UILabel!
    var profile: Profile!
    override func viewDidLoad() {
        super.viewDidLoad()
        members.delegate = self
        members.dataSource = self
        groupName.text = profile.groupName
        bio.text = profile.pBio
        spotsOpen.text = profile.pOpen
        gsize.text = String(profile.pSize)
        if profile.pSize == 1 {
            groupSizeLabel.isHidden = true
            spotsOpenLabel.isHidden = true
            spotsOpen.isHidden = true
            gsize.isHidden = true
           
            
        }
        else {
            groupSizeLabel.isHidden = false
            spotsOpenLabel.isHidden = false
            spotsOpen.isHidden = false
            gsize.isHidden = false
        }
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ChatViewController
        destination.user2UID = profile.documentID
        destination.user2Name = profile.groupName
    }
    
    @IBAction func messagePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "message", sender: nil)
    }
    
}
extension ProfileDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profile.Members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = members.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel!.text = profile.Members[indexPath.row]
        return cell
        
    }
    
    
}
