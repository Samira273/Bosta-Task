//
//  AlbumModel.swift
//  BostaTask
//
//  Created by Samira Marassy on 17/06/2022.
//

import Foundation
struct AlbumModel: Codable, Hashable {
    let id : Int?
    let title : String?
    let userId : Int?
    
    
    enum CodingKeys: String, CodingKey {
        case id 
        case title
        case userId
    }
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(id)
    }

    static func == (lhs: AlbumModel, rhs: AlbumModel) -> Bool {
      lhs.id == rhs.id
    }
}
