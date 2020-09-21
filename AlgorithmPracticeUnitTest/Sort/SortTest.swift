//
//  BubbleSort.swift
//  AlgorithmPracticeUnitTest
//
//  Created by 超杨 on 2020/9/14.
//  Copyright © 2020 superYang. All rights reserved.
//

import XCTest

class SortTest: XCTestCase {

    let testObj = ALGOSort()
    
    func testBubbleSort() {
        let a1 = [1, 3, 5, 2, 4]
        let o1 = [1, 2, 3, 4, 5]
        let r1 = testObj.bubbleSort(a1)
        XCTAssertEqual( r1, o1)
    }
    
    func testInsertionSort() {
        let a1 = [1, 3, 5, 2, 4]
        let o1 = [1, 2, 3, 4, 5]
        let r1 = testObj.insertSort(a1)
        XCTAssertEqual(r1, o1)
    }
    
    func testSelectionSort() {
        let a1 = [1, 3, 5, 2, 4]
        let o1 = [1, 2, 3, 4, 5]
        let r1 = testObj.selectionSort(a1)
        XCTAssertEqual(r1, o1)

    }
    
    func testMergeSort() {
        let a1 = [1, 3, 5, 2, 4]
        let o1 = [1, 2, 3, 4, 5]
        let r1 = testObj.mergeSort(a1)
        XCTAssertEqual(r1, o1)
    }
    
    func testQuickSort() {
        var a1 = [1, 3, 5, 2, 4]
        let o1 = [1, 2, 3, 4, 5]
        testObj.quickSort(&a1, low: 0, high: a1.count - 1)
        XCTAssertEqual(a1, o1)
    }

}
