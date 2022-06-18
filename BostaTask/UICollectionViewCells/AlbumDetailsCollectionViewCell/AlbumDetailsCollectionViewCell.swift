//
//  AlbumDetailsCollectionViewCell.swift
//  BostaTask
//
//  Created by Samira Marassy on 18/06/2022.
//

import UIKit
import Kingfisher

class AlbumDetailsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var detailsImageView: UIImageView!
    let activityInd = UIActivityIndicatorView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
   
    func configureCell(with model: AlbumDetailsModel?) {
        let url =  URL(string: model?.url ?? "")
        if let url = url {
            activityInd.center = CGPoint(x: self.frame.size.width  / 2,
                                         y: self.frame.size.height / 2)
            activityInd.color = UIColor.red
            detailsImageView.addSubview(activityInd)
            activityInd.startAnimating()
            detailsImageView.kf.setImage(with: url, placeholder: nil, options: nil) {[weak self] _ in
                self?.activityInd.stopAnimating()
            }
        } else {
            detailsImageView.image = UIImage(named: "ic_image_placeholder")
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        detailsImageView.kf.cancelDownloadTask()
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
