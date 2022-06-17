//
//  ProfileVC.swift
//  BostaTask
//
//  Created by Samira Marassy on 17/06/2022.
//

import UIKit

class ProfileVC: BaseVC {

    let viewModel: ProfileVM!
    
    init(viewModel: ProfileVM) {
        self.viewModel = viewModel
        super.init(viewModel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
