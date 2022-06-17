//
//  AlbumDetailsVM.swift
//  BostaTask
//
//  Created by Samira Marassy on 17/06/2022.
//

import Foundation
protocol AlbumDetailsVM: BaseVM {
    func loadAlbumDetailsData()
    func getAlbumDetails() -> [AlbumDetailsModel]?
    func getAlbum() -> AlbumModel?
}

class AlbumDetailsVMImpl: AlbumDetailsVM {
    
    var showErrorAlertClosure: ((String?) -> Void)?
    var interntConnected: (() -> Void)?
    var serverErrorStatus: (() -> Void)?
    var showSuccessAlertClousre: ((String) -> Void)?
    var showLoader: (() -> Void)?
    var hideLoader: (() -> Void)?
    var showNoInternetView: (() -> Void)?
    var updateViewWithData: (() -> Void)?
    
    private var album: AlbumModel?
    var albumDetails: [AlbumDetailsModel]?
    
    init(album: AlbumModel?) {
        self.album = album
    }
    
    func loadAlbumDetailsData() {
        showLoader?()
        NetworkManager.shared.getAlbumDetails(albumId: album?.id ?? 0) {[weak self] result, statusCode in
            self?.hideLoader?()
            switch result {
            case .success(let response):
                self?.albumDetails = response
                self?.updateViewWithData?()
            case .failure(let error):
                if error.isNetwork {
                    self?.showNoInternetView?()
                    return
                }
                self?.showErrorAlertClosure?(error.message)
            }
        }
    }
    
    func getAlbumDetails() -> [AlbumDetailsModel]? {
        return albumDetails
    }
    
    func getAlbum() -> AlbumModel? {
        return album
    }
}
