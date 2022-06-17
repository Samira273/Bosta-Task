//
//  AlbumDetailsVC.swift
//  BostaTask
//
//  Created by Samira Marassy on 17/06/2022.
//

import UIKit

class AlbumDetailsVC: BaseVC {
    
    var viewModel: AlbumDetailsVM!
    init(viewModel: AlbumDetailsVM) {
        self.viewModel = viewModel
        super.init(viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadAlbumDetailsData()
        DispatchQueue.main.async {
            self.configureNavBar()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async {
            self.configureNavBar()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    func configureNavBar() {
        let backBarBtnItem = UIBarButtonItem()
        backBarBtnItem.title = viewModel.getAlbum()?.title
        navigationController?.navigationBar.backItem?.backBarButtonItem = backBarBtnItem
    }
    
    override func updateViewWithData() {
        
    }
    
}
