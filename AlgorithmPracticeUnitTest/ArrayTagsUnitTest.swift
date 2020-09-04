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

}
