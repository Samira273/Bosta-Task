//
//  AlbumsAPIs.swift
//  BostaTask
//
//  Created by Samira Marassy on 16/06/2022.
//

import Foundation
import Moya

enum  AlbumsAPIs {
    case getAlbumDetails(albumId: Int?)
    
}

extension AlbumsAPIs: TargetType {
    
    var headers: [String : String]? {
        [:]
    }
    
    
    var baseURL: URL {
        return URL(string: NetworkManager.shared.networkConfig.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .getAlbumDetails:
            return "/photos"
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
        case .getAlbumDetails(let albumId):
                return .requestParameters(parameters: ["albumId": albumId ?? 0], encoding: URLEncoding.queryString)
       
        }
    }
    
}
