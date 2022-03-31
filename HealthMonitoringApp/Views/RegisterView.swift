//
//  RegisterView.swift
//  HealthMonitoringApp
//
//  Created by Dossymkhan Zhulamanov on 15.10.2021.
//

import UIKit

class RegisterView: UIView {

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
    
    public let imageLogo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "caduceus_logo")
        return logo
    }()
    
    let usernameTF: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceholder: "Username", isSecureEntry: false, imageName: "person_male")
    }()
    
    public let registerButton: UIButton = {
        let button = UIButton()
        return button.setWideGreenButton(title: "Register")
    }()
    
    public let goToLogin: UIButton = {
        let btn = UIButton()
        btn.setFunctionalButton(title: "Login", font: 14, titleColor: UIColor.cyan)
        return btn
    }()
    
    public let question: UILabel = {
        let txt = UILabel()
        txt.text = "Already have an account?"
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.textColor = .white
        return txt
    }()
    
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        addSubview(backPanel)
        sendSubviewToBack(backPanel)
        backPanel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 250, paddingleft: 55, paddingBottom: 0, paddingRight: -55, width: 0, height: 0)
        
        // Logo Image
        addSubview(imageLogo)
        imageLogo.anchor(top: nil, left: centerXAnchor, bottom: backPanel.topAnchor, right: nil, paddingTop: 0, paddingleft: -50, paddingBottom: -50, paddingRight: 0, width: 0, height: 0)
        
        addSubview(email)
        email.anchor(top: backPanel.topAnchor, left: backPanel.leftAnchor, bottom: nil, right: backPanel.rightAnchor, paddingTop: 20, paddingleft: 20, paddingBottom: 0, paddingRight: -20, width: 0, height: 45)
        
        addSubview(password)
        password.anchor(top: email.bottomAnchor, left: backPanel.leftAnchor, bottom: nil, right: backPanel.rightAnchor, paddingTop: 20, paddingleft: 20, paddingBottom: 0, paddingRight: -20, width: 0, height: 45)
        
        addSubview(usernameTF)
        usernameTF.anchor(top: password.bottomAnchor, left: backPanel.leftAnchor, bottom: nil, right: backPanel.rightAnchor, paddingTop: 20, paddingleft: 20, paddingBottom: 0, paddingRight: -20, width: 0, height: 45)
        
        addSubview(registerButton)
        registerButton.anchor(top: usernameTF.bottomAnchor, left: backPanel.leftAnchor, bottom: nil, right: backPanel.rightAnchor, paddingTop: 20, paddingleft: 40, paddingBottom: 0, paddingRight: -40, width: 0, height: 45)
        
        addSubview(goToLogin)
        goToLogin.anchor(top: registerButton.bottomAnchor, left: nil, bottom: backPanel.bottomAnchor, right: registerButton.rightAnchor, paddingTop: 10, paddingleft: 0, paddingBottom: -20, paddingRight: 0, width: 0, height: 25)
        
        addSubview(question)
        question.anchor(top: registerButton.bottomAnchor, left: nil, bottom: nil, right: goToLogin.leftAnchor, paddingTop: 10, paddingleft: 0, paddingBottom: -20, paddingRight: -5, width: 0, height: 25)
    
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init?(coder) is not supported")
    }

}
