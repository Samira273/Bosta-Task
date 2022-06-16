//
//  ErrorHandler.swift
//  BostaTask
//
//  Created by Samira Marassy on 16/06/2022.
//

import Foundation
import Moya

enum ErrorHandler: Error {
    case network
    case parseError
    case sessionExpired
}

extension ErrorHandler {
    var message: String {
        switch self {
        case .network:
            return "No internet connection"
        case .parseError:
            return "Something went wrong"
        case .sessionExpired:
            return "Session Expired"
        }
    }
    
    
    var isNetwork: Bool {
        if case .network = self {
            return true
        } else {
            return false
        }
    }
    
    var isSerialization: Bool {
        if case .parseError = self {
            return true
        } else {
            return false
        }
    }
    
    var isSessionExpired: Bool {
        if case .sessionExpired = self {
            return true
        } else {
            return false
        }
    }
}

extension Error {
    var message: String {
        return (self as? ErrorHandler)?.message ?? "Somehing went wrong"
    }
    
    var isNetwork: Bool {
        return (self as? ErrorHandler)?.isNetwork ?? false
    }
    
    var isSerialization: Bool {
        return (self as? ErrorHandler)?.isSerialization ?? false
    }
    
    var isSessionExpired: Bool {
        return (self as? ErrorHandler)?.isSessionExpired ?? false
    }
}
