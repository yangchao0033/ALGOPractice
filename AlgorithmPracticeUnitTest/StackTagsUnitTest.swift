//
//  StackTagsUnitTest.swift
//  AlgorithmPracticeUnitTest
//
//  Created by 超杨 on 2020/8/11.
//  Copyright © 2020 superYang. All rights reserved.
//

import XCTest

class StackTagsUnitTest: XCTestCase {
    let testObj = StackTags()
    
    func testIsValid() {
        let s = "([({}{})])"
        let res = testObj.isValid(s)
        XCTAssertTrue(res)
        
        let s1 = "()[]{}"
        let res1 = testObj.isValid(s1)
        XCTAssertTrue(res1)
        
        let s2 = "(]"
        let res2 = testObj.isValid(s2)
        XCTAssertFalse(res2)
        
        let s3 = "([))"
        let res3 = testObj.isValid(s3)
        XCTAssertFalse(res3)
        
        let s4 = "("
        let res4 = testObj.isValid(s4)
        XCTAssertFalse(res4)
        
        let s5 = ")"
        let res5 = testObj.isValid(s5)
        XCTAssertFalse(res5)
        
    }
    
    func testRemoveDuplicates() {
        let s = "abbaca"
        let res = testObj.removeDuplicates(s)
        XCTAssertEqual(res, "ca")
    }
    
    func testCalPoints() {
        let array = ["5", "2", "C", "D", "+"]
        let res = testObj.calPoints(array)
        XCTAssertEqual(res, 30)
        
        let arry1 = ["5", "-2", "4", "C", "D", "9", "+", "+"]
        let res1 = testObj.calPoints(arry1)
        XCTAssertEqual(res1, 27)
    }
    
    func testNextGreaterElement() {
        
        let n1 = testObj.nextGreaterElement([4, 1, 2], [1, 3, 4, 2])
        XCTAssertEqual(n1, [-1, 3, -1])
        
        let n2 = testObj.nextGreaterElement([2, 4], [1, 2, 3, 4])
        XCTAssertEqual(n2, [3, -1])
    }
    
    func testNextGreaterElements() {
        let n1 = testObj.nextGreaterElements([1, 2, 1])
        XCTAssertEqual(n1, [2, -1, 2])
        
        let n2 = testObj.nextGreaterElements([5, 4, 3, 2, 1])
        XCTAssertEqual(n2, [-1, 5, 5, 5, 5])
    }
    
    func testDailyTemperatures() {
        let n1 = testObj.dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73])
        XCTAssertEqual(n1, [1, 1, 4, 2, 1, 1, 0, 0])
    }

}
