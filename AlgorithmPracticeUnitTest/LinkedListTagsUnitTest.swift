//
//  LinkedListTagsUnitTest.swift
//  AlgorithmPracticeUnitTest
//
//  Created by 超杨 on 2020/7/28.
//  Copyright © 2020 superYang. All rights reserved.
//

import XCTest

class LinkedListTagsUnitTest: XCTestCase {
    let n1 = [0, 2, 4, 6, 8]
    let n2 = [1, 3, 4, 6, 8, 12]
    let testObj = LinkedListTags()
    
    func testDeleteNodeWithVal() {
        let l1 = ListNode.toNodeList(by: n2)
        let l2 = testObj.deleteNode(l1, 8)
        XCTAssertEqual(ListNode.toArray(by: l2), [1, 3, 4, 6, 12])
    }
    
    func testDeleteMiddleNodeWithNode() {
        let l1 = ListNode.toNodeList(by: n2)
        let node = l1?.next?.next?.next // node.val is 6
        testObj.deleteNode(node)
        XCTAssertEqual(ListNode.toArray(by: l1), [1, 3, 4, 8, 12])
    }
    
    func testDeleteFromTo() {
        let l1 = ListNode.toNodeList(by: n2)
        testObj.delete(head: l1, from: 3, to: 8)
        XCTAssertEqual(ListNode.toArray(by: l1), [1, 12])
    }
    
    func testDeleteDuplicates() {
        let l1 = ListNode.toNodeList(by: [1, 1, 1])
        let l2 = testObj.deleteDuplicates(l1)
        XCTAssertEqual(ListNode.toArray(by: l2),
                       [1])
    }
    
    func testDeleteDuplicatesII() {
        let l1 = ListNode.toNodeList(by: [1, 2, 3, 3, 4, 4, 5])
        let l2 = testObj.deleteDuplicatesII(l1)
        XCTAssertEqual(ListNode.toArray(by: l2),
        [1, 2, 5])
        let l3 = ListNode.toNodeList(by: [1, 1, 1])
        let l4 = testObj.deleteDuplicatesII(l3)
        XCTAssertEqual(ListNode.toArray(by: l4),
        [])
    }
    
    func testRemoveNthFromEnd() {
        let l1 = ListNode.toNodeList(by: [1, 2, 3, 4, 5])
        let l2 = testObj.removeNthFromEnd(l1, 2)
        XCTAssertEqual(ListNode.toArray(by: l2),
                       [1, 2, 3, 5])
        
    }
    func testDeleteDuplicateABSNode() {
        let l1 = ListNode.toNodeList(by: [21, -15, 15, -7, 15])
        let l2 = testObj.deleteDuplicateABSNode(l1, 24)
        XCTAssertEqual([21, -15, -7], ListNode.toArray(by: l2))
        
    }
    
    func testGetIntersectionNode() {
        let l0 = ListNode.toNodeList(by: [8, 4, 5])
        let l1 = ListNode.toNodeList(by: [4, 1])
        let l2 = ListNode.toNodeList(by: [5, 0, 1])
        l1?.next?.next = l0
        l2?.next?.next?.next = l0
        XCTAssertEqual(ListNode.toArray(by: l1), [4, 1, 8, 4, 5])
        XCTAssertEqual(ListNode.toArray(by: l2), [5, 0, 1, 8, 4, 5])
//        let node = testObj.getIntersectionNode(headA: l1, headB: l2)
        let node = testObj.getIntersectionNode(l1, l2)
        XCTAssertEqual(node, l0)
    }
    
    func testOddEvenList() {
        let l0 = ListNode.toNodeList(by: [1, 2, 3, 4, 5, 6])
        let l1 = testObj.oddEvenList(l0)
        XCTAssertEqual(ListNode.toArray(by: l1), [1, 3, 5, 2, 4, 6])
        
        let l2 = ListNode.toNodeList(by: [1, 2])
        let l3 = testObj.oddEvenList(l2)
        XCTAssertEqual(ListNode.toArray(by: l3), [1, 2])
    }
    
    func testDetectCycle() {
        let l0 = ListNode.toNodeList(by: [3, 2, 0, -4])
        let h1 = l0?.next
        let last = l0?.next?.next?.next
        last?.next = h1
        let node = testObj.detectCycle(l0)
        XCTAssertEqual(node, h1)
        // 测试无环
        let l2 = ListNode.toNodeList(by: n1)
        let node1 = testObj.detectCycle(l2)
        XCTAssertNil(node1)
    }
    
    func testKthToLast() {
        let l0 = ListNode.toNodeList(by: [1, 2, 3, 4, 5])
        let res = testObj.kthTolast(l0, 2)
        XCTAssertEqual(res, 4)
    }
    
    func testReversePrint() {
        let l0 = ListNode.toNodeList(by: [1, 2, 3])
        let res = testObj.reversePrint(l0)
        XCTAssertEqual(res, [3, 2, 1])
    }
    
    func testIsPalindrome() {
        let l0 = ListNode.toNodeList(by: [1, 2])
        let res0 = testObj.isPalindrome(l0)
        XCTAssertFalse(res0)
        let l1 = ListNode.toNodeList(by: [1, 2, 2, 1])
        let res1 = testObj.isPalindrome(l1)
        XCTAssertTrue(res1)
    }
    
    func testIsPalindrome2() {
        let l0 = ListNode.toNodeList(by: [1, 2])
        let res0 = testObj.isPalindrome2(l0)
        XCTAssertFalse(res0)
        let l1 = ListNode.toNodeList(by: [1, 2, 2, 1])
        let res1 = testObj.isPalindrome2(l1)
        XCTAssertTrue(res1)
    }
    
    func testMiddleNode() {
        let l0 = ListNode.toNodeList(by: [1, 2, 3, 4, 5])
        let middle0 = testObj.middleNode(l0)
        XCTAssertEqual(middle0?.val, 3)
        let l1 = ListNode.toNodeList(by: [1, 2, 3, 4, 5, 6])
        let middle1 = testObj.middleNode(l1)
        XCTAssertEqual(middle1?.val, 4)
    }
    
    func testGetDecimalValue() {
        let l0 = ListNode.toNodeList(by: [1, 0, 1])
        let res = testObj.getDecimalValue(l0)
        XCTAssertEqual(res, 5)
    }
    
}
