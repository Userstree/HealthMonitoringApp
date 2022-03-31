//
//  HomeNavigationController.swift
//  HealthMonitoringApp
//
//  Created by Dossymkhan Zhulamanov on 26.10.2021.
//

import UIKit
import FirebaseAuth

class HomeNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if isLoggedIn() {
            let mainVC = MainViewController()
            viewControllers = [mainVC]
        } else {
            let navController = LoginController()
            pushViewController(navController, animated: true)
        }
    }
    
    fileprivate func isLoggedIn() -> Bool {
        if Auth.auth().currentUser != nil {
            return true
        }
        return false
    }
    
}
