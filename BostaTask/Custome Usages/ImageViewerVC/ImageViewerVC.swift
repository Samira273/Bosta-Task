//
//  ImageViewerVC.swift
//  BostaTask
//
//  Created by Samira Marassy on 18/06/2022.
//

import UIKit

class ImageViewerVC: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var image: UIImage?
    
    init(image: UIImage?) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let backBarBtnItem = UIBarButtonItem()
        backBarBtnItem.title = ""
        navigationController?.navigationBar.backItem?.backBarButtonItem = backBarBtnItem
    }
    
    func setupNavBar() {
        let backBarBtnItem = UIBarButtonItem()
        backBarBtnItem.title = ""
        navigationController?.navigationBar.backItem?.backBarButtonItem = backBarBtnItem
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 6.0
        let shareBar: UIBarButtonItem = UIBarButtonItem(image: Asset.icShare.image.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(shareTapped))
        self.navigationItem.rightBarButtonItem = shareBar
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    @objc
    func shareTapped() {
        guard let image = image else {
            return
        }
        let imageToShare = [ image ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }

}
