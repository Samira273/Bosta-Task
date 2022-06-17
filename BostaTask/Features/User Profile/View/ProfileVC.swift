//
//  ProfileVC.swift
//  BostaTask
//
//  Created by Samira Marassy on 17/06/2022.
//

import UIKit

class ProfileVC: BaseVC {

    let viewModel: ProfileVM!
    
    @IBOutlet weak var profileTableView: UITableView!
    
    init(viewModel: ProfileVM) {
        self.viewModel = viewModel
        super.init(viewModel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    func prepareView() {
        
    }
    
    func loadData() {
        viewModel.getUserProfile {[weak self] profile in
            guard let profile = profile else { return }
            self?.bindDataToView(profile)
        }
    }

    func bindDataToView(_ data: ProfileModel) {
        
    }
}
