//
//  ProfileHeaderView.swift
//  BostaTask
//
//  Created by Samira Marassy on 17/06/2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!

    func configureHeader(with profile: ProfileModel?) {
        userNameLabel.text = profile?.name
        addressLabel.text = profile?.address?.fullAddress
    }
    

}

//MARK: - Helper Methods
extension ProfileHeaderView {
    public static var cellId: String {
        return String(describing: self)
    }
    
    public static var bundle: Bundle {
        return Bundle(for: ProfileHeaderView.self)
    }
    
    public static var nib: UINib {
        return UINib(nibName: ProfileHeaderView.cellId, bundle: ProfileHeaderView.bundle)
    }
    
    public static func register(with tableView: UITableView) {
        tableView.register(ProfileHeaderView.nib, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.cellId)
    }
    
    public static func loadFromNib(owner: Any?) -> ProfileHeaderView {
        return bundle.loadNibNamed(ProfileHeaderView.cellId, owner: owner, options: nil)?.first as! ProfileHeaderView
    }
    
    public static func dequeue(from tableView: UITableView, with profile: ProfileModel?) -> UIView {
        
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.cellId) as? ProfileHeaderView else { return UIView()}
        view.configureHeader(with: profile)
        return view
    }

}

