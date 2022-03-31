//
//  TextFieldExtensions.swift
//  HealthMonitoringApp
//
//  Created by Dossymkhan Zhulamanov on 01.10.2021.
//

import UIKit

extension UITextField{
    
    func textField(withPlaceHolder placeholder: String, isSecureTextEntry: Bool) -> UITextField{
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.textColor = .black
        tf.isSecureTextEntry = isSecureTextEntry
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        return tf
    }
    
    func setLeftIcon(_ image: UIImage){
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView = UIView(frame: CGRect(x: 20, y: 0, width: 35, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode  = .always
    }
    
    func textField(withPlaceholder: String, isSecureEntry: Bool, imageName: String) -> UITextField{
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 6
        tf.placeholder = withPlaceholder
        tf.isSecureTextEntry = isSecureEntry
        tf.setLeftIcon(UIImage(named: imageName)!)
        return tf
    }
    
}
