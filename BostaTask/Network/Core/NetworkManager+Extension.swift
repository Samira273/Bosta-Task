//
//  MoyaProvider+Extension.swift
//  BostaTask
//
//  Created by Samira Marassy on 16/06/2022.
//

import Foundation
import Moya

extension NetworkManager {
    
    func parseResponse<T: Codable>(moyaResult: MoyaCompletion,
                                         completion: @escaping NetworkComplationForObject<T> ) {
        
        switch moyaResult {
        case .success(let response):
            do {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let json = try decoder.decode(T.self, from: response.data)
                if (200...299 ~= response.statusCode) {
                    completion(.success(json), response.statusCode)
                } else {
                    let errorHandler = ErrorHandler.system(error: "Error with status code \(response.statusCode)")
                    completion(.failure(errorHandler), response.statusCode)
                }
            } catch {
                completion(.failure(ErrorHandler.parseError), response.statusCode)
            }

        case .failure:
            let customError = ErrorHandler.network
            completion(.failure(customError), nil)
        }
    }

}
