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
    case getProfileAlbums(userId: Int?)
    
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
        case .getProfileAlbums:
            return "/albums"
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
        case .getProfileAlbums(let userId):
                return .requestParameters(parameters: ["userId": userId ?? 0], encoding: URLEncoding.queryString)
        default:  return .requestPlain
        }
    }
    
}
