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
    var a1 = [Int]()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        for i in 0...10000 { // 大数测试专用
            a1.append(i)
        }
    }
    
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
    
    func testFindKthLargest() {
        let r = testObj.findKthLargest(a1, 99)
        XCTAssertEqual(r, 9902)
    }
    
    func testGetLeastNumbers() {
        let a = [0, 1, 2, 1]
        let r = testObj.getLeastNumbers(a, 1)
        XCTAssert(r == [0])
    }
    
    func testGetBiggestNumbers() {
        var a = [Int]()
        for i in 0..<100000000 {
            a.append(i)
        }
        a.shuffle()
        let r = testObj.getBiggestNumbers(a, 100)
//        XCTAssertEqual(r, [99997, 99998, 99999])
    }
    
}
