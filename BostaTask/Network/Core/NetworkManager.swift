//
//  NetworkManager.swift
//  BostaTask
//
//  Created by Samira Marassy on 16/06/2022.
//

import Foundation
import Moya

typealias StatusCode = Int
typealias MoyaCompletion = (Result<Moya.Response, MoyaError>)
typealias NetworkComplationForObject<T: Codable> = (
    _ result: Swift.Result<T, ErrorHandler>,
    _ statusCode: StatusCode?) -> Void
typealias NetworkComplationForList<T: Codable> = (
    _ result: Swift.Result<[T], ErrorHandler>,
    _ statusCode: StatusCode?) -> Void

class NetworkManager {
    
    static let shared: NetworkManager = { NetworkManager(config: .defaults) }()
    
    var networkConfig: NetworkDefaults!
    
    let provider: MoyaProvider<MultiTarget>
    
    init(config: NetworkDefaults = NetworkDefaults.defaults) {
        
        self.networkConfig = config
        
        let loggerConfig = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        provider = MoyaProvider<MultiTarget>(
            plugins: [NetworkLoggerPlugin(configuration: loggerConfig)])
    }
    
}
