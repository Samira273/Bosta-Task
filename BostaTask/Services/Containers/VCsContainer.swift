//
//  VCsContainer.swift
//  BostaTask
//
//  Created by Samira Marassy on 16/06/2022.
//

import Foundation
import UIKit
import Swinject

class VCsContainer {
    
    static var navController = AppNavigationController()
    
    class func getSplashScene() -> UIViewController {
        guard let vc = Assembler.sharedAssembler.resolver.resolve(SplashVC.self) else {
            fatalError("no splash")
        }
        return vc
    }
    
    

}
