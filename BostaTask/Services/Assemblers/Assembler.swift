//
//  Assembler.swift
//  BostaTask
//
//  Created by Samira Marassy on 16/06/2022.
//

import Foundation
import Swinject

extension Assembler {
    
    static let sharedAssembler: Assembler = {
        
        return  Assembler ([
            AppAssembly(),
            ProfileAssembly()
        ],
        container: Container())
        
    } ()
}
