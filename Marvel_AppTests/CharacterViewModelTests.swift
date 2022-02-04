//
//  CharacterViewModelTests.swift
//  Marvel_AppTests
//
//  Created by admin on 2/3/22.
//

import XCTest
@testable import Marvel_App

class CharacterViewModelTests: XCTestCase {
    
    var viewModel: CharacterViewModel!

    override func setUp() {
        super.setUp()
        viewModel = CharacterViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func test_numberOfRow() {
        let cellViewModel = [DataListCellViewModel(titleText: "test1", subTitleText: "subtitle", imageUrl: "https://wdd.wew")]
        XCTAssertEqual(cellViewModel.count, 1)
        
    }
    
    
}
