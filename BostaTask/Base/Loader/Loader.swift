//
//  Loader.swift
//  BostaTask
//
//  Created by Samira Marassy on 16/06/2022.
//

import UIKit

class Loader {
    public static let shared = Loader()
    var logoImage = UIImageView()
    var bulrImage = UIImageView()
    
    private  init() {
        bulrImage.frame = UIScreen.main.bounds
        bulrImage.backgroundColor = Asset.whiteSmoke.color
        bulrImage.isUserInteractionEnabled = true
        bulrImage.alpha = 0.95
        logoImage.image = Asset.icLogo.image
        logoImage.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        logoImage.contentMode = .scaleAspectFit
        logoImage.center = bulrImage.center
    }
    
    func show() {
        DispatchQueue.main.async {
            AppManager.shared.window?.addSubview(self.bulrImage)
            AppManager.shared.window?.addSubview(self.logoImage)
            self.logoImage.rotate(duration: 1.5)
        }
    }
    
    func hide() {
        DispatchQueue.main.async {
            self.logoImage.stopRotating()
            self.bulrImage.removeFromSuperview()
            self.logoImage.removeFromSuperview()
        }
    }
}
