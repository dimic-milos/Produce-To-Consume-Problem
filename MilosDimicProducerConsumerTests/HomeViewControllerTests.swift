//
//  HomeViewControllerTests.swift
//  HomeViewControllerTests
//
//  Created by Dimic Milos on 4/28/19.
//  Copyright © 2019 Dimic Milos. All rights reserved.
//

import XCTest
@testable import MilosDimicProducerConsumer

class HomeViewControllerTests: XCTestCase {
    
    var sut: HomeViewController!
    
    override func setUp() {
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? HomeViewController
        sut.loadViewIfNeeded()
    }

    func test_hasTableView() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_buttonCreateProducerTapped_WhenTappedOnce_TableViewWilHaveExpectedNumberOfRowsAfterExpectedWaitTime() {
        let expectedWaitTime = 5.0
        let expectedNumberOfRows = 1
        sut.buttonCreateProducerTapped(UIButton())
        
        let result = XCTWaiter.wait(for: [expectation(description: "test after 5 seconds")], timeout: expectedWaitTime)
        if result == .timedOut {
            XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), expectedNumberOfRows)
        } else {
            XCTFail("Delay interrupted")
        }
    }

    func test_buttonCreateConsumerTapped_WhenTappedOnceWhileTenRowsAlreadyAdded_TableViewWillHaveExpectedNumberOfRowsAfterExpectedWaitTime() {
        let expectedWaitTime = 5.0
        let expectedNumberOfRows = 9
        
        for _ in 0..<10 { sut.buttonCreateProducerTapped(UIButton()) }
        sut.buttonCreateConsumerTapped(UIButton())
        
        let result = XCTWaiter.wait(for: [expectation(description: "test after 5 seconds")], timeout: expectedWaitTime)
        if result == .timedOut {
            XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), expectedNumberOfRows)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func test_buttonCreateProducerTapped_WhenTappedTwice_TableViewWilHaveExpectedNumberOfRowsAfterExpectedWaitTime() {
        let expectedWaitTime = 7.0
        let expectedNumberOfRows = 4
        
        for _ in 0..<2 { sut.buttonCreateProducerTapped(UIButton()) }
        
        let result = XCTWaiter.wait(for: [expectation(description: "test after 7 seconds")], timeout: expectedWaitTime)
        if result == .timedOut {
            XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), expectedNumberOfRows)
        } else {
            XCTFail("Delay interrupted")
        }
    }
}
