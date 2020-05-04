//
//  AlgorithmPracticeUnitTest.swift
//  AlgorithmPracticeUnitTest
//
//  Created by 超杨 on 2020/5/3.
//  Copyright © 2020 superYang. All rights reserved.
//

import XCTest

class AlgorithmPracticeUnitTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
//        ClassNameHelper.classNamePasteGet()
    }

/*
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
 */
    func testMaximumSubarray() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertTrue(MaximumSubarray().maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6)
        XCTAssertTrue(MaximumSubarray().maxSubArray([1]) == 1)
    }

    func testJumpGameIi() throws {
        XCTAssertTrue(JumpGameIi().jump([2, 3, 1, 1, 4]) == 2)
    }

    /*
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    */

}
