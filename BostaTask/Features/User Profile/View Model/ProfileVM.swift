//
//  ProfileVM.swift
//  BostaTask
//
//  Created by Samira Marassy on 17/06/2022.
//
typealias networkSuccessCallBack<T: Codable> = ((T?) -> Void)

import Foundation
protocol ProfileVM: BaseVM {
    func getUserProfileData()
    func getUserAlbums() -> [AlbumModel]?
    func getUserProfile() -> ProfileModel?
    var updateProfileTableView: (() -> Void)? {set get}
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
    var albums: [AlbumModel]?
    
    var updateProfileTableView: (() -> Void)?
    
    func getUserProfileData() {
        showLoader?()
        NetworkManager.shared.getProfileData(id: Int.random(in: 1..<11)) {[weak self] result, statusCode in
            switch result {
            case .success(let response):
                self?.profile = response
                self?.modifyProfileWithFullAddress()
                self?.loadUserAlbums()
            case .failure(let error):
                if error.isNetwork {
                    self?.showNoInternetView?()
                    return
                }
                self?.showErrorAlertClosure?(error.message)
            }
        }
    }
    
    func modifyProfileWithFullAddress() {
        var address = ""
        if let street = profile?.address?.street {
            address.append(contentsOf: street)
            address.append(contentsOf: ", ")
        }
        if let city = profile?.address?.city {
            address.append(contentsOf: city)
            address.append(contentsOf: ", ")
        }
        if let suit = profile?.address?.suite {
            address.append(contentsOf: suit)
            address.append(contentsOf: ", ")
        }
        if let zipCode = profile?.address?.zipcode {
            address.append(contentsOf: zipCode)
        }
        self.profile?.address?.fullAddress = address
    }
    
    private func loadUserAlbums() {
        NetworkManager.shared.getProfileAlbums(userId: self.profile?.id) {[weak self] result, statusCode in
            self?.hideLoader?()
            switch result {
            case .success(let response):
                self?.albums = response
                self?.updateProfileTableView?()
            case .failure(let error):
                if error.isNetwork {
                    self?.showNoInternetView?()
                    return
                }
                self?.showErrorAlertClosure?(error.message)
            }
        }
    }
    
    func getUserAlbums() -> [AlbumModel]? {
        return albums
    }
    
    func getUserProfile() -> ProfileModel? {
        return profile
    }
    
}
