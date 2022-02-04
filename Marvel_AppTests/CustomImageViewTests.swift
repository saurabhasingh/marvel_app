//
//  CustomImageViewTests.swift
//  Marvel_AppTests
//
//  Created by admin on 2/3/22.
//

import XCTest
@testable import Marvel_App

class CustomImageViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLoadImageFromServer() {
        let url = "https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/cbf0e41d3ec1fbdcf770e8b92576a30e.jpg"
        let expectation = self.expectation(description: "test_LoadImageFromServer")
        CustomImageView.loadImageUsingCacheWithURLString(url, placeHolder: nil) { (image) in
            XCTAssertNotNil(image)
//            XCTAssertNil(image, "Not found")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

}
