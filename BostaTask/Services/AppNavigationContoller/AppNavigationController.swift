//
//  AppNavigationController.swift
//  BostaTask
//
//  Created by Samira Marassy on 16/06/2022.
//

import Foundation
import UIKit

class AppNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = UIColor.white
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.tintColor = Asset.darkGray.color
        UIBarButtonItem.appearance().setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold)], for: .normal)
    }
    
    func setRoot(window view: UIViewController) {
        self.setViewControllers([view], animated: true)
    }
    
}

extension UINavigationController {
    
    func styleWhiteNavigation() {
                
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithTransparentBackground()
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.compactAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
          //  navBarAppearance.backgroundColor = Asset.Colors.appWhite.color
        } else {
            // Fallback on earlier versions
        }
        navigationBar.isTranslucent = false
      //  navigationBar.clearNavigationBar(backgroundColor: Asset.Colors.appWhite.color)
        
        navigationBar.prefersLargeTitles = false
      //  navigationBar.tintColor = Asset.Colors.darkGray.color
        navigationItem.leftItemsSupplementBackButton = true;
       // navigationController?.navigationBar.titleTextAttributes = [
         //   NSAttributedString.Key.foregroundColor: Asset.Colors.darkGray
     //   ]
      
    }
    
}
