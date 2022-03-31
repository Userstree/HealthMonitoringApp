//
//  UIButtonExtensions.swift
//  HealthMonitoringApp
//
//  Created by Dossymkhan Zhulamanov on 04.10.2021.
//

import UIKit

extension UIButton{
    
    func setFunctionalButton(title text: String, font size: Int, titleColor color: UIColor){
        let button = self
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(size))
        button.setTitleColor(color, for: .normal)
        let underlineAttribute = [NSAttributedString.Key.foregroundColor: UIColor.cyan]
        let underlineAttributedString = NSMutableAttributedString(string: text, attributes: underlineAttribute)
        underlineAttributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        button.titleLabel?.attributedText = underlineAttributedString
    }
    
    func setWideGreenButton(title: String) -> UIButton{
        let button = UIButton()
        button.backgroundColor = UIColor.fieldsMainGreenColor()
        button.layer.cornerRadius = 6
        button.setTitle(title, for: UIControl.State.normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        return button
    }
    
}
