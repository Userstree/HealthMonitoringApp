//
//  Extensions.swift
//  HealthMonitoringApp
//
//  Created by Dossymkhan Zhulamanov on 16.09.2021.
//

import UIKit

extension UIColor{
    
    static func rgb(red:CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static func mainDarkBlueBackgroundColor() -> UIColor{
        return UIColor.rgb(red: 1, green: 25, blue: 32)
    }
    
    static func textFieldBackgroundColor() -> UIColor{
        return UIColor.rgb(red: 1, green: 35, blue: 45)
    }
    
    static func fieldsMainGreenColor() -> UIColor{
        return UIColor.rgb(red: 5, green: 255, blue: 165)
    }
    
}
