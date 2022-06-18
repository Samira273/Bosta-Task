//
//  ProfileAssembly.swift
//  BostaTask
//
//  Created by Samira Marassy on 16/06/2022.
//

import Foundation
import Swinject
import UIKit

class ProfileAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(ProfileVM.self) { _ in ProfileVMImpl() }
        
        container.register(ProfileVC.self) { r in
            let vc = ProfileVC(viewModel: r.resolve(ProfileVM.self)!)
            return vc
        }
        
        container.register(AlbumDetailsVM.self) { _, arg in
            AlbumDetailsVMImpl(album: arg)
        }
        
        container.register(AlbumDetailsVC.self) { (r: Resolver, arg: AlbumModel?) in
            AlbumDetailsVC(viewModel: r.resolve(AlbumDetailsVM.self, argument: arg)!)
        }
        
        container.register(ImageViewerVC.self) { (r: Resolver, arg: UIImage?) in
            ImageViewerVC(image: arg)
        }
        
    }
    
}
