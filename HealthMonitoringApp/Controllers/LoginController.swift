//
//  File.swift
//  HealthMonitoringApp
//
//  Created by Dossymkhan Zhulamanov on 14.10.2021.
//

import UIKit
import Firebase

class LoginController: UIViewController {
    
    let loginpad = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.mainDarkBlueBackgroundColor()

        loginpad.frame = self.view.frame
        
        view.addSubview(loginpad)
        loginpad.goToRegister.addTarget(self, action: #selector(handleMoveToRegister), for: .touchUpInside)
        loginpad.loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        loginpad.forgotPasswordButton.addTarget(self, action: #selector(handleForgotPassword), for: .touchUpInside)
    }
    
    @objc func handleMoveToRegister(){
        let registerVC = RegisterVC()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @objc func handleLogin(){
        if let email = loginpad.email.text, let password = loginpad.password.text{
            signUserIn(email: email, password: password)
        }else{
            print("Login does not work")
        }
    }
    
    @objc func handleForgotPassword() {
        let forgotPasswordVC = ForgotPasswordViewController()
        self.navigationController?.pushViewController(forgotPasswordVC, animated: true)
    }
    
}

extension LoginController {
    func signUserIn(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                //ALERT CONTROLLER IS NEEDED
                print("Failed to sign user in with error ", error.localizedDescription)
                return
            }
            self.navigationController?.viewControllers = [MainViewController()]
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
