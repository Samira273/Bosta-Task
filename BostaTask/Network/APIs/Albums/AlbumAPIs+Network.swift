//
//  AlbumAPIs+Network.swift
//  BostaTask
//
//  Created by Samira Marassy on 17/06/2022.
//

import Foundation
import Moya

extension NetworkManager {
   
    
    func getAlbumDetails(albumId: Int?, completion: @escaping (
        _ result: Swift.Result<[AlbumDetailsModel], ErrorHandler>,
        _ statusCode: StatusCode?) -> Void) {
        self.provider.request(MultiTarget(AlbumsAPIs.getAlbumDetails(albumId: albumId))) { (result) in
            self.parseResponse(moyaResult: result, completion: completion)
        }
    }

}
