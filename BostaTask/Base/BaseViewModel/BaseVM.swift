//
//  BaseVM.swift
//  BostaTask
//
//  Created by Samira Marassy on 16/06/2022.
//

import Foundation

protocol BaseVM {
    // MARK: - Closure Collection
    var showErrorAlertClosure: ((String?) -> Void)? {set get}
    var interntConnected: (() -> Void)? {set get}
    var serverErrorStatus: (() -> Void)? {set get}
    var showSuccessAlertClousre: ((String) -> Void)? {set get}
    var showLoader: (() -> Void)? {set get}
    var hideLoader: (() -> Void)? {set get}
    var showNoInternetView: (() -> Void)? {set get}
    var updateViewWithData: (() -> Void)? {set get}

}
