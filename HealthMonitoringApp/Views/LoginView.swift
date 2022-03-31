//
//  LoginView.swift
//  HealthMonitoringApp
//
//  Created by Dossymkhan Zhulamanov on 14.10.2021.
//

import UIKit

class LoginView: UIView {
    
    public let email: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceholder: "Email", isSecureEntry: false, imageName: "email_icon")
    }()
    
    public let password: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceholder: "Password", isSecureEntry: true, imageName: "lock")
    }()
    
    let backPanel: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.textFieldBackgroundColor()
        view.layer.cornerRadius = 21
        return view
    }()
    
    public let loginButton: UIButton = {
        let button = UIButton()
        return button.setWideGreenButton(title: "Login")
    }()
    
    public let imageLogo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "caduceus_logo")
        return logo
    }()
    
    public let forgotPasswordButton: UIButton = {
        let btn = UIButton()
        let buttonLabel = "Password?"
        btn.setFunctionalButton(title: buttonLabel, font: 14, titleColor: UIColor.cyan)
        return btn
    }()
    
    public let forgot: UILabel = {
        let text = UILabel()
        text.text = "Forgot"
        text.font = UIFont.systemFont(ofSize: 14)
        text.textColor = UIColor.white
        return text
    }()
    
    public let goToRegister: UIButton = {
        let btn = UIButton()
        btn.setFunctionalButton(title: "Create", font: 14, titleColor: UIColor.cyan)
        return btn
    }()
    
    public let question: UILabel = {
        let txt = UILabel()
        txt.text = "Don't have an account?"
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.textColor = .white
        return txt
    }()
    
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        sendSubviewToBack(backPanel)
        addSubview(backPanel)
        backPanel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 250, paddingleft: 55, paddingBottom: 0, paddingRight: -55, width: 0, height: 0)
        
        addSubview(email)
        email.anchor(top: backPanel.topAnchor, left: backPanel.leftAnchor, bottom: nil, right: backPanel.rightAnchor, paddingTop: 20, paddingleft: 20, paddingBottom: 0, paddingRight: -20, width: 0, height: 45)
        
        addSubview(password)
        password.anchor(top: email.bottomAnchor, left: backPanel.leftAnchor, bottom: nil, right: backPanel.rightAnchor, paddingTop: 20, paddingleft: 20, paddingBottom: 0, paddingRight: -20, width: 0, height: 45)
        
        addSubview(forgotPasswordButton)
        forgotPasswordButton.anchor(top: password.bottomAnchor, left: nil, bottom: nil, right: backPanel.rightAnchor, paddingTop: 15, paddingleft: 0, paddingBottom: 0, paddingRight: -20, width: 0, height: 25)

        addSubview(forgot)
        forgot.anchor(top: password.bottomAnchor, left: nil, bottom: nil, right: forgotPasswordButton.leftAnchor, paddingTop: 15, paddingleft: 0, paddingBottom: 0, paddingRight: -3, width: 0, height: 25)
        
        addSubview(loginButton)
        loginButton.anchor(top: forgotPasswordButton.bottomAnchor, left: backPanel.leftAnchor, bottom: nil, right: backPanel.rightAnchor, paddingTop: 20, paddingleft: 45, paddingBottom: -15, paddingRight: -45, width: 0, height: 45)
        
        addSubview(goToRegister)
        goToRegister.anchor(top: loginButton.bottomAnchor, left: nil, bottom: backPanel.bottomAnchor, right: loginButton.rightAnchor, paddingTop: 10, paddingleft: 0, paddingBottom: -15, paddingRight: 0, width: 45, height: 25)
        
        addSubview(question)
        question.anchor(top: loginButton.bottomAnchor, left: nil, bottom: nil, right: goToRegister.leftAnchor, paddingTop: 10, paddingleft: 0, paddingBottom: 0, paddingRight: -5, width: 0, height: 25)
        
        addSubview(imageLogo)
        imageLogo.anchor(top: nil, left: centerXAnchor, bottom: backPanel.topAnchor, right: nil, paddingTop: 0, paddingleft: -50, paddingBottom: -50, paddingRight: 0, width: 0, height: 0)
        
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init?(coder) is not supported")
    }
}
