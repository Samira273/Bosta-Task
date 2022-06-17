//
//  AlbumDetailsVM.swift
//  BostaTask
//
//  Created by Samira Marassy on 17/06/2022.
//

import Foundation
protocol AlbumDetailsVM: BaseVM {
    
}

class AlbumDetailsVMImpl: AlbumDetailsVM {
    
    var showErrorAlertClosure: ((String?) -> Void)?
    var interntConnected: (() -> Void)?
    var serverErrorStatus: (() -> Void)?
    var showSuccessAlertClousre: ((String) -> Void)?
    var showLoader: (() -> Void)?
    var hideLoader: (() -> Void)?
    var showNoInternetView: (() -> Void)?
    
    
}
