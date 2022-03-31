//
//  RegisterViewController.swift
//  HealthMonitoringApp
//
//  Created by Dossymkhan Zhulamanov on 15.10.2021.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class RegisterVC: UIViewController {
    
    let registerView = RegisterView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.mainDarkBlueBackgroundColor()
        
        registerView.frame = self.view.frame
        view.addSubview(registerView)
        registerView.goToLogin.addTarget(self, action: #selector(handleMoveToLogin), for: .touchUpInside)
        registerView.registerButton.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
    }
    
    @objc func handleMoveToLogin() {
        print("Go to Login button works")
        _ = navigationController?.popViewController(animated: true)
    }

    @objc func handleRegister() {

        if let email = registerView.email.text, let password = registerView.password.text, let username = registerView.usernameTF.text {
            registerUser(withEmail: email, password: password, username: username)
            
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                
                if let error = error{
                    //ALERT CONTROLLER IS NEEDED
                    print("Failed to sign user in with error ", error.localizedDescription)
                    return
                }
                
                print("Successfully signed in")
                
                guard let navVC = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else { return }
                guard let controller = navVC.viewControllers[0] as? MainViewController else { return }
                controller.configureViewComponents()
                self.dismiss(animated: true, completion: nil)
            
            }
            
        } else {
            print("Did not work")
        }
        
    }

}

extension RegisterVC {
    //MARK: -- API
        func registerUser(withEmail email: String, password: String, username: String) {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print("An error: \(error.localizedDescription) has occured while registering New User")
                    return
                }
                guard let uid = result?.user.uid else {
                    return
                }
                let values = ["email": email, "password": password, "username": username ]
                Database.database(url: "https://healthmonitoring-1ca88-default-rtdb.europe-west1.firebasedatabase.app/").reference().child("users").child(uid).setValue(values)
            }
        }
}
