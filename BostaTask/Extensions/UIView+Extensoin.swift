//
//  UIView+Extensoin.swift
//  BostaTask
//
//  Created by Samira Marassy on 17/06/2022.
//

import Foundation
import UIKit
extension UIView {
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
}
