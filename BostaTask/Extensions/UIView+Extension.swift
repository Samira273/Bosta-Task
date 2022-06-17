//
//  UIView+Extension.swift
//  BostaTask
//
//  Created by Samira Marassy on 17/06/2022.
//

import Foundation
import UIKit
extension UIView {
    func showupAnimated(_ completion:(() -> Void)? = nil) {
        
        if !self.isHidden { return }
        if self.superview is UIStackView {
            UIView.animate(withDuration: 0.25, animations: {
                self.isHidden = false
            }, completion: { _ in
                completion?()
            })
            return
        }
        self.alpha = 0
        self.isHidden = false
        
        UIView.animate(withDuration: 0.25, animations: {
            self.alpha = 1
        }, completion: { _ in
            completion?()
        })
    }
    
    func animateShakeing() {
        
        let animation = CASpringAnimation(keyPath: "transform.translation.x")
        
        animation.fromValue = 0
        animation.toValue = 10
        
        animation.duration = 0.1
        animation.repeatCount = 2
        animation.autoreverses = true
        
        animation.initialVelocity = 0.0
        animation.damping = 0.5
        
        self.layer.add(animation, forKey: "shaking")
    }
    
    func animateHeartbeating() {
        
        let animation = CASpringAnimation(keyPath: "transform.scale")
        
        animation.duration = 0.25
        
        animation.fromValue = 1.0
        animation.toValue = 1.25
        
        animation.autoreverses = true
        
        animation.initialVelocity = 0.5
        animation.damping = 0.8
        
        self.layer.add(animation, forKey: "beating")
    }
}
