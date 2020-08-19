//
//  ClimbingStarsUnitTest.swift
//  AlgorithmPracticeUnitTest
//
//  Created by 超杨 on 2020/8/17.
//  Copyright © 2020 superYang. All rights reserved.
//

import XCTest

class ClimbingStarsUnitTest: XCTestCase {

    let testObj = ClimbingStars()
    
    func testClimbingStars() {
        XCTAssertEqual(testObj.climStars(1), 1)
        XCTAssertEqual(testObj.climStars(2), 2)
        XCTAssertEqual(testObj.climStars(3), 3)
        XCTAssertEqual(testObj.climStars(12), 233)
    }

}
