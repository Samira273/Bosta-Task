//
//  ProfileTableViewCell.swift
//  BostaTask
//
//  Created by Samira Marassy on 17/06/2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//MARK: - Helper Methods
extension ProfileTableViewCell {
    public static var cellId: String {
        return String(describing: self)
    }
    
    public static var bundle: Bundle {
        return Bundle(for: ProfileTableViewCell.self)
    }
    
    public static var nib: UINib {
        return UINib(nibName: ProfileTableViewCell.cellId, bundle: ProfileTableViewCell.bundle)
    }
    
    public static func register(with tableView: UITableView) {
        tableView.register(ProfileTableViewCell.nib, forCellReuseIdentifier: ProfileTableViewCell.cellId)
    }
    
    public static func loadFromNib(owner: Any?) -> ProfileTableViewCell {
        return bundle.loadNibNamed(ProfileTableViewCell.cellId, owner: owner, options: nil)?.first as! ProfileTableViewCell
    }
    
    public static func dequeue(from tableView: UITableView, for indexPath: IndexPath, with album: AlbumModel?, lastCell: Bool? = false) -> ProfileTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.cellId, for: indexPath) as! ProfileTableViewCell
        //cell.configure(with: product, lastCell: lastCell)
        return cell
    }

}

