//
//  MoyaProvider+Extension.swift
//  BostaTask
//
//  Created by Samira Marassy on 16/06/2022.
//

import Foundation
import Moya
import PromiseKit

extension MoyaProvider {
    
    func requestPromise (_ target: Target) -> Promise<Moya.Response> {
        
        return Promise<Moya.Response> { (resolver) in
            
            self.requestConnectivity(target) { (result) in
                
                switch result {
                case let .success(response):
                    resolver.fulfill(response)
                case .failure:
                    resolver.reject(ErrorHandler.network)
                }
            }
        }
    }

    private func requestConnectivity(_ target: Target, completion: @escaping Moya.Completion) {
        
        self.request(target) { (result) in
            
            switch result {
                
            case let .success(response):
                completion(.success(response))
                
            case let .failure(error):
                
                if let response = error.response {
                    completion(.success(response))
                } else {
                    completion(.failure(error))
                }
            }
        }
    }

}
