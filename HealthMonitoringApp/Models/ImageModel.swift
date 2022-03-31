//
//  AvatarModel.swift
//  HealthMonitoringApp
//
//  Created by Dossymkhan Zhulamanov on 19.10.2021.
//

import UIKit
import FirebaseStorage

public class ImageModel {
    
    var image: UIImage
    var text: String
    
    public init(text: String, image: UIImage){
        self.text = text
        self.image = image
    }
    
}
