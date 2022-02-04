//
//  ServicesTests.swift
//  Marvel_AppTests
//
//  Created by admin on 2/3/22.
//

import XCTest
@testable import Marvel_App

class ServicesTests: XCTestCase {

    override func setUp() {
        super.setUp()
        
    }

    func test_services() {
        let url = APIUrl.url
        let expectation = self.expectation(description: "test_services")
        Services.getCharacterList(url: url, page: "1") { (success, data) in
            XCTAssertNotNil(data)
            XCTAssertEqual(data?.articles?.count ?? 0, 20)
            XCTAssertEqual(data?.totalResult, 62969)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
