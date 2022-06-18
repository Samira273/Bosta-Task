//
//  BostaTaskTests.swift
//  BostaTaskTests
//
//  Created by Samira Marassy on 16/06/2022.
//

import XCTest
@testable import BostaTask

class NetworkManagerTests: XCTestCase {
    
    var sut: NetworkManager!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = NetworkManager.shared
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetProfileData()  {
        let id = Int.random(in: 1..<11)
        let expected = ProfileModel(company: nil, email: nil, id: id, name: nil, phone: nil, username: nil, website: nil)
        var response: ProfileModel?
        sut.getProfileData(id: id) { result, statusCode in
            if case let .success(user) = result {
                response = user
            }
            XCTAssert(response == expected)
        }
    }

    func testGetProfileAlbums() {
        let expectedListCount = 10
        sut.getAlbumDetails(albumId: Int.random(in: 1..<11)) { result, statusCode in
            if case let .success(albums) = result {
                XCTAssert(albums.count == expectedListCount)
            }
        }
    }

}
