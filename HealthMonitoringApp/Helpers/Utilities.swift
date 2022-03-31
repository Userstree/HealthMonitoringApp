//
//  Utilities.swift
//  HealthMonitoringApp
//
//  Created by Dossymkhan Zhulamanov on 05.10.2021.
//

import UIKit

class Utilities{
    
    static func isPasswordValid(_ password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
            return passwordTest.evaluate(with: password)
    }
    
}
