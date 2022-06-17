//
//  LoaderProtocol.swift
//  BostaTask
//
//  Created by Samira Marassy on 16/06/2022.
//

import Foundation
import  UIKit

protocol LoaderProtocol {
    func showLoader(type: LoaderType, backgroundColor: UIColor?)
    func hideLoader()
}

enum LoaderType {
    case custom, native
}
