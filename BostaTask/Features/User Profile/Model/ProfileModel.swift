//
//  ProfileModel.swift
//  BostaTask
//
//  Created by Samira Marassy on 17/06/2022.
//

import Foundation
struct ProfileModel: Codable, Equatable {
    static func == (lhs: ProfileModel, rhs: ProfileModel) -> Bool {
        lhs.id == rhs.id
    }
    
    
    var address : AddressModel?
    let company : CompanyModel?
    let email : String?
    let id : Int?
    let name : String?
    let phone : String?
    let username : String?
    let website : String?

    enum CodingKeys: String, CodingKey {
        case address
        case company
        case email
        case id
        case name
        case phone
        case username
        case website
    }

}
struct CompanyModel: Codable {
    let bs : String?
    let catchPhrase : String?
    let name : String?
    
    
    enum CodingKeys: String, CodingKey {
        case bs
        case catchPhrase
        case name
    }
}
struct AddressModel: Codable {
    let city : String?
    let street : String?
    let suite : String?
    let zipcode : String?
    var fullAddress: String?
    
    enum CodingKeys: String, CodingKey {
        case city
        case street
        case suite
        case zipcode
    }
}
