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
    
    func testBuildArray() {
        let n1 = testObj.buildArray([2, 3, 4], 4)
        XCTAssertEqual(n1, ["Push", "Pop", "Push", "Push", "Push"])
    }
    
    func testBackspaceCompare() {
        let r1 = testObj.backspaceCompare("ab#c", "ad#c")
        XCTAssertTrue(r1)
        
        let r2 = testObj.backspaceCompare("ab##", "c#d#")
        XCTAssertTrue(r2)
        
        let r3 = testObj.backspaceCompare("a#c", "b")
        XCTAssertFalse(r3)
    }
    
    func testRemoveOuterParentheses() {
        let s1 = testObj.removeOuterParentheses("(()())(())")
        XCTAssertEqual(s1, "()()()")
        
        let s2 = testObj.removeOuterParentheses("(()())(())(()(()))")
        XCTAssertEqual(s2, "()()()()(())")
        
        let s3 = testObj.removeOuterParentheses("()()")
        XCTAssertEqual(s3, "")
    }
    
    func testMakeGood() {
        let s1 = testObj.makeGood("leEeetcode")
        XCTAssertEqual(s1, "leetcode")
        
        let s2 = testObj.makeGood("abBAcC")
        XCTAssertEqual(s2, "")
        
        let s3 = testObj.makeGood("s")
        XCTAssertEqual(s3, "s")
    }

    func testExclusiveTime() {
        let logs = ["0:start:0",
        "1:start:2",
        "1:end:5",
        "0:end:6"]
        let times = testObj.exclusiveTime(2, logs)
        XCTAssertEqual(times, [3, 4])
    }
    
    func testFind132pattern() {
        XCTAssertFalse(testObj.find132pattern([1, 2, 3, 4]))
        XCTAssertTrue(testObj.find132pattern([3, 1, 4, 2]))
        XCTAssertTrue(testObj.find132pattern([-1, 3, 2, 0]))
    }
    
    func testDecodeAtIndex() {
        XCTAssertEqual(testObj.decodeAtIndex("leet2code3", 10), "o")
        XCTAssertEqual(testObj.decodeAtIndex("ha22", 5), "h")
        XCTAssertEqual(testObj.decodeAtIndex("a2345678999999999999999", 1), "a")
    }
    
    func testAsteroidCollision() {
        XCTAssertEqual(testObj.asteroidCollision([5, 10, -5]), [5, 10])
        XCTAssertEqual(testObj.asteroidCollision([8, -8]), [])
        XCTAssertEqual(testObj.asteroidCollision([10, 2, -5]), [10])
        XCTAssertEqual(testObj.asteroidCollision([-2, -1, 1, 2]), [-2, -1, 1, 2])
    }
}
