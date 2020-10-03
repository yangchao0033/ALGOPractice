//
//  ArrayTagsUnitTest.swift
//  AlgorithmPracticeUnitTest
//
//  Created by 超杨 on 2020/7/29.
//  Copyright © 2020 superYang. All rights reserved.
//

import XCTest

class ArrayTagsUnitTest: XCTestCase {
    let n1 = [0, 2, 4, 6, 8]
    let n2 = [1, 3, 4, 6, 8, 12]
    let arrayTags = ArrayTags()
    
    func testRotateArrat() {
        var arr = n2
        RotateArray().rotate(&arr, 9)
        XCTAssertEqual(arr, [6, 8, 12, 1, 3, 4])
        
        var arr2 = n2
        RotateArray().rotate(&arr2, 0)
        XCTAssertEqual(arr2, n2)
    }
    
    func testMajorityElement() {
        let arr = [1, 2, 5, 9, 5, 9, 5, 5, 5]
        XCTAssertEqual(arrayTags.majorityElement(arr),
                       5)
    }
    
    func testGenerate() {
        let res = arrayTags.generate(5)
        let ans = [
             [1],
            [1, 1],
           [1, 2, 1],
          [1, 3, 3, 1],
         [1, 4, 6, 4, 1]
        ]
        XCTAssertEqual(res, ans)

    }
    
    func testFindMedianSortedArrays() {
        let res = arrayTags.findMedianSortedArrays([1, 3], [2])
        XCTAssertEqual(res, 2)
        
        let res1 = arrayTags.findMedianSortedArrays([1, 2], [3, 4])
        XCTAssertEqual(res1, 2.5)
        
        let res2 = arrayTags.findMedianSortedArrays([], [1])
        XCTAssertEqual(res2, 1)

    }
    
    func testMultiply() {
        let s = arrayTags.multiply("123", "456")
        XCTAssertEqual(s, "56088")
    }
    
    func testMinNumberDisappeared() {
        let res = arrayTags.minNumberDisappeared([-1, 2, 3, 4])
        XCTAssertEqual(1, res)
        
        let res1 = arrayTags.minNumberDisappeared([1, 2, 3, 4])
        XCTAssertEqual(5, res1)
    }
    
    func testMerge() {
        let a1 = [Interval(10, 30),
                  Interval(20, 60),
                  Interval(80, 100),
                  Interval(150, 180)]
        let res = arrayTags.merge(a1)
        print(res)
    }
}
