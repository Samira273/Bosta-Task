//
//  ProfileAPIs.swift
//  BostaTask
//
//  Created by Samira Marassy on 16/06/2022.
//

import Foundation
import Moya

enum  ProfileAPIs {
    case getProfileData(id: Int)
    
}

extension ProfileAPIs: TargetType {
    
    var headers: [String : String]? {
        [:]
    }
    
    
    var baseURL: URL {
        return URL(string: NetworkManager.shared.networkConfig.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .getProfileData(let id):
        return "/users/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        default:  return .requestPlain
        }
    }
    
}
