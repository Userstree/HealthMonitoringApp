//
//  AppDelegate.swift
//  HealthMonitoringApp
//
//  Created by Dossymkhan Zhulamanov on 10.09.2021.
//

import UIKit
import Firebase
import FirebaseAuth

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = HomeNavigationController()
        return true
    }

}

