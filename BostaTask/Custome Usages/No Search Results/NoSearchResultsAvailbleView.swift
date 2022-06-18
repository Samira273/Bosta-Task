//
//  NoSearchResultsAvailbleView.swift
//  BostaTask
//
//  Created by Samira Marassy on 18/06/2022.
//

import UIKit

class NoSearchResultsAvailbleView: UIView {

    let nibName = "NoSearchResultsAvailbleView"
    private var contentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    func xibSetup() {

        contentView = loadViewFromNib()
        // use bounds not frame or it'll be offset
        contentView?.frame = self.bounds
        // Adding custom subview on top of our view
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = true
        self.addSubview(contentView)
    }

    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

}
