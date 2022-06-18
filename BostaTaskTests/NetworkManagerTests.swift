//
//  BostaTaskTests.swift
//  BostaTaskTests
//
//  Created by Samira Marassy on 16/06/2022.
//

import XCTest
import Moya

@testable import BostaTask

class NetworkManagerTests: XCTestCase {
    
    var sut: NetworkManager!
    let stubbingProvider = MoyaProvider<ProfileAPIs>(stubClosure: MoyaProvider.immediatelyStub)
 //   let stubbingDelayedProvider = MoyaProvider<ProfileAPIs>(stubClosure: MoyaProvider.delayedStub(5))
    
//    let serverErrorEndpointClosure = { (target: ProfileAPIs) -> Endpoint in
//      return Endpoint(url: URL(target: target).absoluteString,
//                      sampleResponseClosure: { .networkResponse(500, .empty) },
//                      method: target.method,
//                      task: target.task,
//                      httpHeaderFields: target.headers)
//    }
//
//    var serverErrorProvider: MoyaProvider<ProfileAPIs>!
//
    let networkErrorEndpointClosure = { (target: ProfileAPIs) -> Endpoint in
      return Endpoint(url: URL(target: target).absoluteString,
                      sampleResponseClosure: { .networkError(ErrorHandler.network as NSError) },
                      method: target.method,
                      task: target.task,
                      httpHeaderFields: target.headers)
    }
    
    var networkErrorProvider: MoyaProvider<ProfileAPIs>!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = NetworkManager.shared
     //   serverErrorProvider = MoyaProvider<ProfileAPIs>(endpointClosure: serverErrorEndpointClosure, stubClosure: MoyaProvider.immediatelyStub)
        networkErrorProvider = MoyaProvider<ProfileAPIs>(endpointClosure: networkErrorEndpointClosure, stubClosure: MoyaProvider.immediatelyStub)
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
    
    func testImmediateStub() {
        let expectation = self.expectation(description: "request")
        _ = stubbingProvider.request(.getProfileData(id: Int.random(in: 1..<11))) { res in
            // pass or fail depending on your test needs
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 3.0, handler: nil)
    }
    
    func testNetworkError() {
        func testDelayedStub() {
            let expectation = self.expectation(description: "networkError")
            _ = networkErrorProvider.request(.getProfileData(id: Int.random(in: 1..<11))) { res in
                // pass or fail depending on your test needs
                expectation.fulfill()
            }
            self.waitForExpectations(timeout: 5.0, handler: nil)
        }
    }
//    func testDelayedStub() {
//        let expectation = self.expectation(description: "requestDelayed")
//        _ = stubbingDelayedProvider.request(.getProfileData(id: Int.random(in: 1..<11))) { res in
//            // pass or fail depending on your test needs
//            expectation.fulfill()
//        }
//        self.waitForExpectations(timeout: 5.0, handler: nil)
//    }

}
