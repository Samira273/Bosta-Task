//
//  SplashVC.swift
//  BostaTask
//
//  Created by Samira Marassy on 16/06/2022.
//

import UIKit

class SplashVC: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        customeAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            AppManager.shared.setWindowRoot(VCsContainer.getProfileScene())
        }
    }
    
    func customeAnimation() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        
        animation.duration = 1
        
        animation.fromValue = 1.0
        animation.toValue = 1.25
        
        animation.autoreverses = true
        
        animation.initialVelocity = 0.5
        animation.damping = 0.8
        
        logoImage.layer.add(animation, forKey: "beating")
    }

}
