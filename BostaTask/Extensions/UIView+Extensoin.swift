//
//  UIView+Extensoin.swift
//  BostaTask
//
//  Created by Samira Marassy on 17/06/2022.
//

import Foundation
import UIKit
extension UIView {
    private static let kRotationAnimationKey = "rotationanimationkey"
    
    var isHiddenIfNeeded: Bool {
        get {
            return self.isHidden
        }
        set {
            if self.isHidden != newValue {
                self.isHidden = newValue
            }
        }
    }
    
    
    func animateHeartbeating() {
        
        let animation = CASpringAnimation(keyPath: "transform.scale")
        
        animation.duration = 1.25
        
        animation.fromValue = 1.0
        animation.toValue = 1.25
        
        animation.autoreverses = true
        
        animation.initialVelocity = 0.5
        animation.damping = 0.5
        
        self.layer.add(animation, forKey: "beating")
    }
    
    func rotate(duration: Double = 1) {
        if layer.animation(forKey: UIView.kRotationAnimationKey) == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = Float.pi * 2
            rotationAnimation.duration = duration
            rotationAnimation.repeatCount = .infinity
            layer.add(rotationAnimation, forKey: UIView.kRotationAnimationKey)
        }
    }
    
    func stopRotating() {
        if layer.animation(forKey: UIView.kRotationAnimationKey) != nil {
            layer.removeAnimation(forKey: UIView.kRotationAnimationKey)
        }
    }
}
