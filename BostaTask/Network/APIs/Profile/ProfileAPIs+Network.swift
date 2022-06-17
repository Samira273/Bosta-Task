//
//  ProfileAPIs+Network.swift
//  BostaTask
//
//  Created by Samira Marassy on 16/06/2022.
//

import Foundation
import Moya

extension NetworkManager {
   
    func getProfileData(id: Int, completion: @escaping (
        _ result: Swift.Result<ProfileModel, ErrorHandler>,
        _ statusCode: StatusCode?) -> Void) {
        self.provider.request(MultiTarget(ProfileAPIs.getProfileData(id: id))) { (result) in
            self.parseResponse(moyaResult: result, completion: completion)
        }
    }

}
