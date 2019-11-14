//
//  FirstViewController.swift
//  Roomeaze
//
//  Created by Isabelle Smyth on 11/4/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {


    
    @IBOutlet weak var tableView: UITableView!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    
    
}
extension FirstViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        
            cell.bio.text = cell.pArray[indexPath.row].pBio
            cell.groupImage.image = cell.pArray[indexPath.row].pImage
            cell.groupName.text = cell.pArray[indexPath.row].groupName
            cell.numberNeeded.text = cell.pArray[indexPath.row].pPNum
            cell.peopleNeeded.text = cell.pArray[indexPath.row].pPNeeded
            cell.bio.isEditable = false
        cell.cardView.applyConfig(for: indexPath, numberOfCellsInSection: tableView.numberOfRows(inSection: indexPath.section))
        if cell.numberNeeded.text == "0" {
            cell.numberNeeded.isHidden = true
        }
        else {
            cell.numberNeeded.isHidden = false
        }
        cell.cardView.roundCorners(cornerRadius: 20.0)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}

extension UIView {
    func applyConfig(for indexPath: IndexPath, numberOfCellsInSection: Int) {
        switch indexPath.row {
        case numberOfCellsInSection - 1:
            // This is the case when the cell is last in the section,
            // so we round to bottom corners
            self.roundCorners(cornerRadius: 25)

            // However, if it's the only one, round all four
            if numberOfCellsInSection == 1 {
                self.roundCorners(cornerRadius: 25)
            }
            
        case 0:
            // If the cell is first in the section, round the top corners
            self.roundCorners(cornerRadius: 25)
            
        default:
            // If it's somewhere in the middle, round no corners
            self.roundCorners(cornerRadius: 25)
        }
    }
}
