//
//  SinglyLinkedCircularListTests.swift
//  AlgorithmPracticeUnitTest
//
//  Created by 超杨 on 2020/7/24.
//  Copyright © 2020 superYang. All rights reserved.
//

import XCTest

class SinglyLinkedCircularListTests: XCTestCase {
    
    let numbers = [1, 2, 5, 7, 11, 13, 17]
    
    fileprivate func buildList() -> SinglyLinkedCircularList<Int> {
        let list = SinglyLinkedCircularList<Int>()
        for number in numbers {
            list.append(number)
        }
        return list
    }
    
    func testEmptyList() {
        let list = SinglyLinkedCircularList<Int>()
        XCTAssertTrue(list.isEmpty)
        XCTAssertEqual(list.count, 0)
        XCTAssertNil(list.last)
    }
    
    func testListWithOneElement() {
        let list = SinglyLinkedCircularList<Int>()
        list.append(123)
        
        XCTAssertFalse(list.isEmpty)
        XCTAssertEqual(list.count, 1)
        
        XCTAssertNotNil(list.head!.next)
        XCTAssertTrue(list.head!.next === list.head)
        
        XCTAssertEqual(list.head!.value, 123)
        XCTAssertNotNil(list.last)
        XCTAssertTrue(list.last!.next === list.head)
        XCTAssertEqual(list.last!.value, 123)
        
        XCTAssertTrue(list.head === list.last)
    }
    
    func testListWithTwoElements() {
        let list = SinglyLinkedCircularList<Int>()
        list.append(123)
        list.append(456)
        
        XCTAssertEqual(list.count, 2)
        
        XCTAssertEqual(list.head!.value, 123)
        
        XCTAssertNotNil(list.last)
        XCTAssertEqual(list.last!.value, 456)
        
        XCTAssertTrue(list.head !== list.last)
        
        XCTAssertTrue(list.head!.next === list.last)
        XCTAssertTrue(list.last!.next === list.head)
        XCTAssertNotNil(list.last!.next)
    }
    
    func testListPrintAll() {
        //        let list = SinglyLinkedCircularList<Int>()
        let list = buildList()
        //        list.append(123)
        //        list.append(456)
        list.printAll()
        XCTAssertTrue(true)
        //        XCTAssertEqual(list.count, numbers.count)
    }
    
    func testListInsertEmpty() {
        //        let list = SinglyLinkedCircularList<Int>()
        //
        //        list.insert(12, at: 0)
        
        let list = buildList()
        list.printAll()
        list.insert(51, at: 7)
        list.printAll()
        
        //        XCTAssertEqual(list.head?.value, 12)
        //        XCTAssertEqual(list.last?.value, 12)
        //        XCTAssertNotNil(list.head)
        //        XCTAssertTrue(list.head?.next === list.head)
    }
    
    func testListRemoveFirst() {
//        let list = SinglyLinkedCircularList<Int>()
//        list.insert(1, at: 0)
//        list.insert(2, at: 0)
//        list.insert(3, at: 0)
        let list = buildList()
        XCTAssertEqual(list[0], numbers[0])
        list.remove(at: 0)
        XCTAssertEqual(list.count, numbers.count - 1)
        XCTAssertEqual(list[0], numbers[1])
    }
    
    func testListRemoveOther() {
        let list = buildList()
        list.printAll()
        XCTAssertEqual(list[0], 1)
        XCTAssertEqual(list.count, numbers.count)
        list.remove(at: 1)
        list.printAll()
        XCTAssertEqual(list.count, numbers.count - 1)
        XCTAssertEqual(list.node(at: 1).value, 5)
        
        list.remove(at: 5)
        list.printAll()
        XCTAssertEqual(list.last?.value, 13)
        XCTAssertTrue(list.last?.next === list.head)
    }
     
}
