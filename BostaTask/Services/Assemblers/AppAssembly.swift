//
//  AppAssembly.swift
//  BostaTask
//
//  Created by Samira Marassy on 16/06/2022.
//

import Foundation
import Swinject

class AppAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(SplashVC.self) { (r:Resolver) in
            return SplashVC()
        }
    }
    
}
