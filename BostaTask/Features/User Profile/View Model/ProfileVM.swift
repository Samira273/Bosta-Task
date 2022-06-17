//
//  ProfileVM.swift
//  BostaTask
//
//  Created by Samira Marassy on 17/06/2022.
//
typealias networkSuccessCallBack<T: Codable> = ((T?) -> Void)

import Foundation
protocol ProfileVM: BaseVM {
    func getUserProfile(completion: @escaping networkSuccessCallBack<ProfileModel>)
}

class ProfileVMImpl: ProfileVM {
    
    var showErrorAlertClosure: ((String?) -> Void)?
    var interntConnected: (() -> Void)?
    var serverErrorStatus: (() -> Void)?
    var showSuccessAlertClousre: ((String) -> Void)?
    var showLoader: (() -> Void)?
    var hideLoader: (() -> Void)?
    var showNoInternetView: (() -> Void)?
    
    var profile: ProfileModel?
    
    func getUserProfile(completion: @escaping networkSuccessCallBack<ProfileModel>) {
        showLoader?()
        NetworkManager.shared.getProfileData(id: Int.random(in: 1..<11)) {[weak self] result, statusCode in
            self?.hideLoader?()
            switch result {
            case .success(let response):
                self?.profile = response
                completion(response)
            case .failure(let error):
                if error.isNetwork {
                    self?.showNoInternetView?()
                    completion(nil)
                    return
                }
                completion(nil)
                self?.showErrorAlertClosure?(error.message)
            }
        }
    }
    
}
