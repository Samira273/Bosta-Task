//
//  Loader.swift
//  BostaTask
//
//  Created by Samira Marassy on 16/06/2022.
//

import UIKit

class Loader: NSObject {

    static var sharedViewSpinner: UIView?
    static let image = UIImage()

    class func show (onView: UIView, type: LoaderType, backGroundColor: UIColor? = .white) {
        
        if sharedViewSpinner != nil {
            sharedViewSpinner?.removeFromSuperview()
            sharedViewSpinner = nil
        }

        let spinnerView = UIView(frame: UIScreen.main.bounds)
        spinnerView.backgroundColor = backGroundColor
        let viewBackgroundLoading: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))

        switch type {
        case .custom:
            let activityIndicator = UIImageView(image: image)
            activityIndicator.center = viewBackgroundLoading.center
            viewBackgroundLoading.addSubview(activityIndicator)

        case .native:
            let activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.color = .red
            activityIndicator.startAnimating()
            activityIndicator.center = viewBackgroundLoading.center
            viewBackgroundLoading.addSubview(activityIndicator)
        }

        viewBackgroundLoading.center = spinnerView.center
        viewBackgroundLoading.backgroundColor = UIColor.white
        viewBackgroundLoading.alpha = 0.5
        viewBackgroundLoading.clipsToBounds = true
        viewBackgroundLoading.layer.cornerRadius = 15

        spinnerView.addSubview(viewBackgroundLoading)
        onView.addSubview(spinnerView)

        sharedViewSpinner = spinnerView
    }

    class func hide() {
        sharedViewSpinner?.removeFromSuperview()
        sharedViewSpinner = nil
    }
}
