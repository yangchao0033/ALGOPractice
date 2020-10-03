//
//  MathTagsTest.swift
//  AlgorithmPracticeUnitTest
//
//  Created by 超杨 on 2020/9/21.
//  Copyright © 2020 superYang. All rights reserved.
//

import XCTest

class MathTagsTest: XCTestCase {

    let testObj = MathTags()
    
    func testLongestCommonPrefix() {
        let res = testObj.longestCommonPrefix(["fldog", "flag", "fly"])
        XCTAssertEqual(res, "fl")
    }
    
    func testThreeSum() {
        let res = testObj.threeSum([-1, 0, 1, 2, -1, -4])
        print(res)
        XCTAssertEqual(res, [[-1, -1, 2], [-1, 0, 1]])
    }

}
