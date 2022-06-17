//
//  ProfileModel.swift
//  BostaTask
//
//  Created by Samira Marassy on 17/06/2022.
//

import Foundation
struct ProfileModel: Codable {
    
    let address : AddressModel?
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
        case email = "email"
        case id = "id"
        case name = "name"
        case phone = "phone"
        case username = "username"
        case website = "website"
    }
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        address = try AddressModel(from: decoder)
//        company = try CompanyModel(from: decoder)
//        email = try values.decodeIfPresent(String.self, forKey: .email)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//        phone = try values.decodeIfPresent(String.self, forKey: .phone)
//        username = try values.decodeIfPresent(String.self, forKey: .username)
//        website = try values.decodeIfPresent(String.self, forKey: .website)
//    }

}
struct CompanyModel: Codable {
    let bs : String?
    let catchPhrase : String?
    let name : String?
    
    
    enum CodingKeys: String, CodingKey {
        case bs = "bs"
        case catchPhrase = "catchPhrase"
        case name = "name"
    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        bs = try values.decodeIfPresent(String.self, forKey: .bs)
//        catchPhrase = try values.decodeIfPresent(String.self, forKey: .catchPhrase)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//    }
}
struct AddressModel: Codable {
    let city : String?
    let street : String?
    let suite : String?
    let zipcode : String?
    
    
    enum CodingKeys: String, CodingKey {
        case city = "city"
        case street = "street"
        case suite = "suite"
        case zipcode = "zipcode"
    }
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        city = try values.decodeIfPresent(String.self, forKey: .city)
//        street = try values.decodeIfPresent(String.self, forKey: .street)
//        suite = try values.decodeIfPresent(String.self, forKey: .suite)
//        zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode)
//    }
}
