//
//  AppManager.swift
//  BostaTask
//
//  Created by Samira Marassy on 16/06/2022.
//

import Foundation
import UIKit
import Reachability
class AppManager: NSObject {
    
    static let shared: AppManager = AppManager()

    private(set) var window: UIWindow?
    static var reachability = try! Reachability()
    
    static func launchApp(_ application: UIApplication) {
        if #available(iOS 13, *) {
            setUpReachability()
            // use UICollectionViewCompositionalLayout
            //Scene Delegate will call  initWindow(windowScene: UIWindowScene)
        } else {
            initWindow()
        }
    }
    
 
    static private func initWindow() { //for ios less than 13
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = VCsContainer.getSplashScene()
        window.makeKeyAndVisible()
        self.shared.window = window
    }
    
    static func initWindow(_ windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = VCsContainer.getSplashScene()
        window.makeKeyAndVisible()
        self.shared.window = window
    }
    
    func setWindowRoot(_ viewController: UIViewController) {
        self.window?.rootViewController = viewController
    }
    
    static func setUpReachability() {
        
        reachability.whenUnreachable = { _ in
            self.reachability.whenReachable = { reachability in
                NotificationCenter.default.post(name: .networkReConnected, object: nil)
            }
        }

        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }

}
