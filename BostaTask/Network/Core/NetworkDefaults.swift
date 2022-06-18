//
//  NetworkDefaults.swift
//  BostaTask
//
//  Created by Samira Marassy on 16/06/2022.
//

import Foundation
struct NetworkDefaults {

    var baseUrl: String = "https://jsonplaceholder.typicode.com"
    
    static var `defaults` : NetworkDefaults {
        return NetworkDefaults()
    }
}
