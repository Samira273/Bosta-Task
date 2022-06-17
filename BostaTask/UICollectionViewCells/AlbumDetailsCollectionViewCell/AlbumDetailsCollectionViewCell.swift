//
//  AlbumDetailsCollectionViewCell.swift
//  BostaTask
//
//  Created by Samira Marassy on 18/06/2022.
//

import UIKit

class AlbumDetailsCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(with model: AlbumDetailsModel?) {
//        let url =  image
//        if let url = url {
//            productImage.kf.setImage(with: URL(string: url))
//        } else {
//            productImage.image = UIImage(named: "ic_pizza")
//        }
    }

}


//MARK: - Helper Methods
extension AlbumDetailsCollectionViewCell {
    public static var cellId: String {
        return "AlbumDetailsCollectionViewCell"
    }
    
    public static var bundle: Bundle {
        return Bundle(for: AlbumDetailsCollectionViewCell.self)
    }
    
    public static var nib: UINib {
        return UINib(nibName: AlbumDetailsCollectionViewCell.cellId, bundle: AlbumDetailsCollectionViewCell.bundle)
    }
    
    public static func register(with collectionView: UICollectionView) {
        collectionView.register(AlbumDetailsCollectionViewCell.nib, forCellWithReuseIdentifier: AlbumDetailsCollectionViewCell.cellId)
    }
    
    public static func loadFromNib(owner: Any?) -> AlbumDetailsCollectionViewCell {
        return bundle.loadNibNamed(AlbumDetailsCollectionViewCell.cellId, owner: owner, options: nil)?.first as! AlbumDetailsCollectionViewCell
    }
    
    public static func dequeue(from collectionView: UICollectionView, for indexPath: IndexPath, albumDetails: AlbumDetailsModel?) -> AlbumDetailsCollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumDetailsCollectionViewCell.cellId, for: indexPath) as! AlbumDetailsCollectionViewCell
        cell.configureCell(with: albumDetails)
        return cell
    }

}
