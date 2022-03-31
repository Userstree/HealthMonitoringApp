//
//  Cell_Image_ViewModel.swift
//  HealthMonitoringApp
//
//  Created by Dossymkhan Zhulamanov on 28.10.2021.
//

import UIKit

class Image_ViewModel {
    
    private var _text: String
    private var _image: UIImage
    
    public init(cellImage: ImageModel) {
        self._text = cellImage.text
        self._image = cellImage.image
    }
    
    public var image: UIImage{
        get {
            return self._image
        }
        set {
            self._image = newValue
        }
    }
    
    public var text: String {
        get {
            return self._text
        }
        set {
            self._text = newValue
        }
    }
    
}
