//
//  TabBarController.swift
//  RoomEaze
//
//  Created by Isabelle Smyth on 12/4/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import UIKit
class TabBarController: UITabBarController, UITabBarControllerDelegate {
    var feedViewController: FirstViewController!
    var myProfileViewController: SecondViewController!
    var profile: Profile!
    override func viewDidLoad() {
        super.viewDidLoad()
        feedViewController = FirstViewController()
        myProfileViewController = SecondViewController()
        self.delegate = self as UITabBarControllerDelegate
        

        // Do any additional setup after loading the view.
    }
    
      func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
       // if viewController.isKind(of: FirstViewController.self) {
            
        //}

          return true
    
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
