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

}
