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
    
    class func getProfileScene() -> UIViewController {
        guard let vc = Assembler.sharedAssembler.resolver.resolve(ProfileVC.self) else {
            fatalError("no profile")
        }
        return embedVCInNavController(vc)
    }
    
    class func embedVCInNavController(_ viewController: UIViewController) -> UIViewController {
        navController.setRoot(window: viewController)
          return navController
    }
    
    class func getAlbumDetailsScene(album: AlbumModel?) -> UIViewController {
        guard let vc = Assembler.sharedAssembler.resolver.resolve(AlbumDetailsVC.self, argument: album) else {
            fatalError("no album details")
        }
        return vc
    }

}
