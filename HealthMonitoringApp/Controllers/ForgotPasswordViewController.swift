//
//  ForgotPasswordViewController.swift
//  HealthMonitoringApp
//
//  Created by Dossymkhan Zhulamanov on 04.11.2021.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    let forgotPasswordView = ForgotPasswordView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forgotPasswordView.frame = self.view.frame
        
        view.addSubview(forgotPasswordView)
        view.backgroundColor = UIColor.mainDarkBlueBackgroundColor()
        
        forgotPasswordView.submitButton.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)
        forgotPasswordView.cancelButton.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        
    }
    
    @objc func handleSubmit() {
        
    }
    
    @objc func handleCancel() {
        forgotPasswordView.email.text = ""
    }
    
}
