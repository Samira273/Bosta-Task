//
//  BaseVC.swift
//  BostaTask
//
//  Created by Samira Marassy on 16/06/2022.
//

import UIKit
import SwiftMessages

class BaseVC: UIViewController {
    
    var baseVM: BaseVM?
    var noInternetView = NoInternetView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(networkReConnected),
            name: .networkReConnected,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(reachabilityChanged),
            name: .reachabilityChanged, object: nil)
    }
    
    init(_ viewModel: BaseVM) {
        self.baseVM = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
    }
    
    func setupViewModel() {

        self.baseVM?.showErrorAlertClosure = { msg in
            self.hideLoader()
            self.showError(message: msg ?? "")
        }

        self.baseVM?.interntConnected = {
            print("Internet connected") //reload
            self.removeNoInternetView()
            self.reload()
        }

        self.baseVM?.serverErrorStatus = {
            print("Server Error / Unknown Error")
            // show UI Server is Error
        }

        self.baseVM?.showSuccessAlertClousre = { msg in
            //self.showSucessMessage(sucessMessage: msg)//
        }

        self.baseVM?.showLoader = {
            self.showLoader(view: self.view, type: .native)
        }

        self.baseVM?.hideLoader = {
            self.hideLoader()
        }
        self.baseVM?.showNoInternetView = {
            self.showNoInternetView()
        }

    }

    func reload() {
      //  fatalError("func must be implmented")
        removeNoInternetView()
    }

    func showNoInternetView() {
        addNoInternetView()
    }

    @objc
    func networkReConnected() {
        reload()
    }

    @objc
    func reachabilityChanged() {
        if AppManager.reachability.connection == .unavailable {
            showNoInternetView()
        }
    }

    deinit {
        AppManager.reachability.stopNotifier()
    }

    func showError(message: String) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.button?.isHidden = true
        view.configureTheme(.error)
        view.configureDropShadow()
        var config = SwiftMessages.Config()
        config.presentationContext = .window(windowLevel: .statusBar)
        view.configureContent(title: "Error", body: message)
        view.titleLabel?.font = .systemFont(ofSize: 16)
        view.bodyLabel?.font = .systemFont(ofSize: 16)
        view.layoutMarginAdditions = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        SwiftMessages.show(config: config, view: view)
    }
    
}

extension BaseVC: LoaderProtocol {

    func showLoader(view: UIView, type: LoaderType, backgroundColor: UIColor? = .white) {
        Loader.show(onView: view, type: type, backGroundColor: backgroundColor)
    }

    func hideLoader() {
        Loader.hide()
    }
}

extension BaseVC {

    func addNoInternetView() {
        noInternetView = NoInternetView(frame: self.view.frame)
        self.view.addSubview(noInternetView)
    }

    func addNoInternetView(onView: UIView) {
        noInternetView = NoInternetView(frame: onView.frame)
        onView.addSubview(noInternetView)
    }

    func removeNoInternetView() {
        noInternetView.removeFromSuperview()
    }

}
