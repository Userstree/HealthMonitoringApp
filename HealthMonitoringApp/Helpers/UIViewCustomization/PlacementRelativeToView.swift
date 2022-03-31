//
//  PlacementRelativeToView.swift
//  HealthMonitoringApp
//
//  Created by Dossymkhan Zhulamanov on 02.10.2021.
//

import UIKit

extension UIView{
    
// MARK: Placing constraints using Anchors
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingleft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat ){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingleft).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
    
    
// MARK: To adjust anchor relative to View.Center
    func constraintsForAnchoringTo(boundsOf view: UIView) -> [NSLayoutConstraint]{
        return [ topAnchor.constraint(equalTo: view.topAnchor),
                 leadingAnchor.constraint(equalTo: view.leadingAnchor),
                 trailingAnchor.constraint(equalTo: view.trailingAnchor),
                 bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ]
    }
    
}
