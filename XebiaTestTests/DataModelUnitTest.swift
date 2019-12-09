//
//  DataModelUnitTest.swift
//  XebiaTestTests
//
//  Created by mojave on 06/12/19.
//  Copyright © 2019 Narender. All rights reserved.
//

import XCTest
@testable import XebiaTest

class DataModelUnitTest: XCTestCase {
    var mostPopularNewsDataModel:MostPopularDataModel!


    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let newsModel = NewsDataModel.init(title: "News", abstract: "everything is news today", published_date: "6/12/2019", byline: "by Narender singh", mediaUrl: ["https://www.team8.vc/wp-content/uploads/2017/07/img_avatar.jpg"])
        mostPopularNewsDataModel = MostPopularDataModel.init(status: "ok", copyright: "jagan", num_results: 11, results: [newsModel])
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mostPopularNewsDataModel = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertTrue(mostPopularNewsDataModel.status == "ok")
         XCTAssertTrue(mostPopularNewsDataModel.copyright == "jagan")
         XCTAssertTrue(mostPopularNewsDataModel.num_results == 11)
        XCTAssertTrue(mostPopularNewsDataModel.results?.count ?? 0 > 0 )
        
        let model = mostPopularNewsDataModel.results![0]
        
        XCTAssertTrue(model.title == "News")
        XCTAssertTrue(model.abstract == "everything is news today")
        XCTAssertTrue(model.published_date == "6/12/2019")
        XCTAssertTrue(model.byline == "by Narender singh")
        XCTAssertTrue(model.mediaUrl?.count ?? 0 > 0)
        XCTAssertFalse(model.byline == "by hiralal")

    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let newsModel = NewsDataModel.init(title: "News", abstract: "everything is news today", published_date: "6/12/2019", byline: "by Narender singh", mediaUrl: ["https://www.team8.vc/wp-content/uploads/2017/07/img_avatar.jpg"])
            mostPopularNewsDataModel = MostPopularDataModel.init(status: "ok", copyright: "jagan", num_results: 11, results: [newsModel])
        }
    }

}
