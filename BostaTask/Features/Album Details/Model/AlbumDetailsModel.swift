//
//  AlbumDetailsModel.swift
//  BostaTask
//
//  Created by Samira Marassy on 17/06/2022.
//

import Foundation
struct AlbumDetailsModel: Codable, Hashable {
    let albumId : Int?
    let id : Int?
    let thumbnailUrl : String?
    let title : String?
    let url : String?
    
    
    enum CodingKeys: String, CodingKey {
        case albumId
        case id
        case thumbnailUrl
        case title
        case url
    }
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(id)
    }

    static func == (lhs: AlbumDetailsModel, rhs: AlbumDetailsModel) -> Bool {
      lhs.id == rhs.id
    }
}
