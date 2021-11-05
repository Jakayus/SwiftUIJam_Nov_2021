//
//  SwiftUIJam_Nov_2021Tests.swift
//  SwiftUIJam_Nov_2021Tests
//
//  Created by Takasur Azeem on 06/11/2021.
//

import XCTest
@testable import SwiftUIJam_Nov_2021

class SwiftUIJam_Nov_2021Tests: XCTestCase {

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
    
    func testAddition() {
        let calculator = ExpressionCalculator()
        let result = try? calculator.evaluate("2 + 2")
        XCTAssertNotNil(result)
        XCTAssertEqual(result, "4.0")
    }

}
