//
//  ForgotPasswordView.swift
//  HealthMonitoringApp
//
//  Created by Dossymkhan Zhulamanov on 04.11.2021.
//

import UIKit

class ForgotPasswordView: UIView {
    
    public let imageLogo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "caduceus_logo")
        return logo
    }()
    
    let backPanel: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.textFieldBackgroundColor()
        view.layer.cornerRadius = 21
        return view
    }()
    
    public let label: UILabel = {
        let label = UILabel()
        label.text = "Reset Password"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.white
        return label
    }()
    
    public let text: UILabel = {
        let label = UILabel()
        label.text = "Please enter the email adress used for registration"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.white
        label.numberOfLines = 2
        return label
    }()
    
    public let email: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceholder: "Email", isSecureEntry: false, imageName: "email_icon")
    }()
    
    public let submitButton: UIButton = {
        let button = UIButton()
        return button.setWideGreenButton(title: "Submit")
    }()
    
    public let cancelButton: UIButton = {
        let button = UIButton()
        return button.setWideGreenButton(title: "Cancel")
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        sendSubviewToBack(backPanel)
        addSubview(backPanel)
        backPanel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 250, paddingleft: 55, paddingBottom: 0, paddingRight: -55, width: 0, height: 0)
        
        addSubview(imageLogo)
        imageLogo.anchor(top: nil, left: centerXAnchor, bottom: backPanel.topAnchor, right: nil, paddingTop: 0, paddingleft: -50, paddingBottom: -50, paddingRight: 0, width: 0, height: 0)
        
        addSubview(label)
        label.anchor(top: backPanel.topAnchor, left: backPanel.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingleft: 100, paddingBottom: 0, paddingRight: 0, width: 0, height: 25)
    
        addSubview(text)
        text.anchor(top: label.bottomAnchor, left: backPanel.leftAnchor, bottom: nil, right: backPanel.rightAnchor, paddingTop: 5, paddingleft: 20, paddingBottom: 0, paddingRight: -20, width: 0, height: 55)
        
        addSubview(email)
        email.anchor(top: text.bottomAnchor, left: backPanel.leftAnchor, bottom: nil, right: backPanel.rightAnchor, paddingTop: 5, paddingleft: 20, paddingBottom: 0, paddingRight: -20, width: 45, height: 45)
        
        addSubview(submitButton)
        submitButton.anchor(top: email.bottomAnchor, left: backPanel.leftAnchor, bottom: nil, right: backPanel.rightAnchor, paddingTop: 20, paddingleft: 45, paddingBottom: 0, paddingRight: -45, width: 0, height: 45)
        
        addSubview(cancelButton)
        cancelButton.anchor(top: submitButton.bottomAnchor, left: backPanel.leftAnchor, bottom: backPanel.bottomAnchor, right: backPanel.rightAnchor, paddingTop: 20, paddingleft: 45, paddingBottom: -20, paddingRight: -45, width: 0, height: 45)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
