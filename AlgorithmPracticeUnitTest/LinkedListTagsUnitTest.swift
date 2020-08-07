//
//  LinkedListTagsUnitTest.swift
//  AlgorithmPracticeUnitTest
//
//  Created by 超杨 on 2020/7/28.
//  Copyright © 2020 superYang. All rights reserved.
//

import XCTest
// swiftlint:disable type_body_length
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
        XCTAssertTrue(node === l0)
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
        XCTAssertTrue(node === h1)
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
    
    func testRemoveDuplicateNodes() {
        let l0 = ListNode.toNodeList(by: [1, 2, 3, 3, 2, 1])
        let l1 = testObj.removeDuplicateNodes(l0)
        XCTAssertEqual(ListNode.toArray(by: l1), [1, 2, 3])
        let l2 = ListNode.toNodeList(by: [1, 1, 1, 2])
        let l3 = testObj.removeDuplicateNodes(l2)
        XCTAssertEqual(ListNode.toArray(by: l3), [1, 2])
    }
    func testPartition() {
        let l0 = ListNode.toNodeList(by: [3, 5, 8, 5, 10, 2, 1])
        let l1 = testObj.partition(l0, 5)
        XCTAssertTrue(isPartitionTrue(l1, 5))
        print(ListNode.toArray(by: l1))
    }
    func isPartitionTrue(_ head: ListNode?, _ x: Int) -> Bool {
        var node = head
        var left = true
        while let nd = node {
            if left && nd.val >= x {
                left = false
            }
            if left == false && nd.val < x {
                return false
            }
            node = nd.next
        }
        return true
    }
    
    func testCopyRandomList() {
        let arr = [[7, nil], [13, 0], [11, 4], [10, 2], [1, 0]]
        let dummy = RNode(-1)
        var cur = dummy
        var ma = [RNode]()
        for item in arr {
            if let val = item[0] {
                let node = RNode(val)
                ma.append(node)
                cur.next = node
                cur = node
            }
        }
        
        var i = 0
        for item in arr {
            let node = ma[i]
            if let val = item[1] {
                node.random = ma[val]
            }
            i += 1
        }
        _ = testObj.copyRandomList(dummy.next)
        
    }
    
    func testRemoveZeroSumSublists() {
        let l1 = ListNode.toNodeList(by: [1, 2, 3, -3, -2])
        //        let l1 = ListNode.toNodeList(by: [1, -1])
        let l2 = testObj.removeZeroSumSublists(l1)
        var node = l2
        while let nd = node, let next = nd.next {
            if nd.val + next.val == 0 {
                XCTFail("校验失败，存在连续相加为0的节点")
                break
            }
            node = next
        }
    }
    
    func testAddTwoNumbers() {
        let l1 = ListNode.toNodeList(by: [2, 4, 3])
        let l2 = ListNode.toNodeList(by: [5, 6, 4])
        let l3 = testObj.addTwoNumbers(l1, l2)
        XCTAssertEqual(ListNode.toArray(by: l3), [7, 0, 8])
        
        let l4 = ListNode.toNodeList(by: [9, 9, 9])
        let l5 = ListNode.toNodeList(by: [1])
        let l6 = testObj.addTwoNumbers(l4, l5)
        XCTAssertEqual(ListNode.toArray(by: l6), [0, 0, 0, 1])
    }
    
    func testAddTwoNumbersII() {
        let l1 = ListNode.toNodeList(by: [7, 2, 4, 3])
        let l2 = ListNode.toNodeList(by: [5, 6, 4])
        let l3 = testObj.addTwoNumbersII(l1, l2)
        XCTAssertEqual(ListNode.toArray(by: l3), [7, 8, 0, 7])
        
        let l4 = ListNode.toNodeList(by: [9, 9, 9])
        let l5 = ListNode.toNodeList(by: [1])
        let l6 = testObj.addTwoNumbersII(l4, l5)
        XCTAssertEqual(ListNode.toArray(by: l6), [1, 0, 0, 0])
    }
    
    func testReorderList() {
        let l1 = ListNode.toNodeList(by: [1, 2, 3, 4, 5])
        testObj.reorderList(l1)
        XCTAssertEqual(ListNode.toArray(by: l1), [1, 5, 2, 4, 3])
        let l2 = ListNode.toNodeList(by: [1, 2, 3, 4, 5, 6])
        testObj.reorderList(l2)
        XCTAssertEqual(ListNode.toArray(by: l2), [1, 6, 2, 5, 3, 4])
    }
    
    func testReverseBetween() {
        let l1 = ListNode.toNodeList(by: [1, 2, 3, 4, 5])
        let l2 = testObj.reverseBetween(l1, 2, 4)
        XCTAssertEqual(ListNode.toArray(by: l2), [1, 4, 3, 2, 5])
        let l3 = ListNode.toNodeList(by: [1, 2, 3, 4, 5])
        let l4 = testObj.reverseBetween(l3, 1, 5)
        XCTAssertEqual(ListNode.toArray(by: l4), [5, 4, 3, 2, 1])
    }
    
    func testMyLinkedList() {
        let linkedList = MyLinkedList()
        linkedList.addAtHead(7)
        linkedList.addAtHead(2)
        linkedList.addAtHead(1)
        linkedList.addAtIndex(3, 0)
        linkedList.deleteAtIndex(2)
        linkedList.addAtHead(6)
        linkedList.addAtTail(4)
        XCTAssertEqual(linkedList.get(4), 4)
        linkedList.addAtHead(4)
        linkedList.addAtIndex(5, 0)
        linkedList.addAtHead(6)
    }
    
    func testSplitListToParts() {
        let l1 = ListNode.toNodeList(by: [1, 2, 3])
        let array = testObj.splitListToParts(l1, 5)
        var res = [[Int?]]()
        for item in array {
            let itemArray = ListNode.toArray(by: item)
            res.append(itemArray)
        }
        XCTAssertEqual(res, [[1], [2], [3], [], []])
        let l2 = ListNode.toNodeList(by: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
        let array2 = testObj.splitListToParts(l2, 3)
        var res2 = [[Int?]]()
        for item in array2 {
            let itemArray = ListNode.toArray(by: item)
            res2.append(itemArray)
        }
        XCTAssertEqual(res2, [[1, 2, 3, 4], [5, 6, 7], [8, 9, 10]])
        let l3 = ListNode.toNodeList(by: [])
        let array3 = testObj.splitListToParts(l3, 3)
        print(array3)
    }
    
    func testRotateRight() {
        let l1 = ListNode.toNodeList(by: [1, 2, 3, 4, 5])
        let l2 = testObj.rotateRight(l1, 7)
        XCTAssertEqual(ListNode.toArray(by: l2), [4, 5, 1, 2, 3])
        
        let l3 = ListNode.toNodeList(by: [])
        let l4 = testObj.rotateRight(l3, 0)
        XCTAssertEqual(ListNode.toArray(by: l4), [])
        
        let l5 = ListNode.toNodeList(by: [1, 2])
        let l6 = testObj.rotateRight(l5, 0)
        XCTAssertEqual(ListNode.toArray(by: l6), [1, 2])
    }
    
    func testNumComponents() {
        let l1 = ListNode.toNodeList(by: [0, 1, 2, 3, 4])
        let g = [0, 3, 1, 4]
        let res = testObj.numComponents(l1, g)
        XCTAssertEqual(res, 2)
    }
    
    func testReverseKGroup() {
        let l1 = ListNode.toNodeList(by: [1, 2, 3, 4, 5])
        let l2 = testObj.reverseKGroup(l1, 2)
        let arr = ListNode.toArray(by: l2)
        XCTAssertEqual(arr, [2, 1, 4, 3, 5])
        
        let l3 = ListNode.toNodeList(by: [1, 2, 3, 4, 5])
        let l4 = testObj.reverseKGroup(l3, 3)
        let arr1 = ListNode.toArray(by: l4)
        XCTAssertEqual(arr1, [3, 2, 1, 4, 5])
    }
    
    func testMergeSortedList() {
        let a1 = [0, 2, 4, 6, 8]
        let a2 = [1, 3, 4, 6, 8, 12]
        let l1 = ListNode.toNodeList(by: a1)
        let l2 = ListNode.toNodeList(by: a2)
        let l3 = testObj.mergeTwoLists(l1, l2)
        XCTAssertEqual([0, 1, 2, 3, 4, 4, 6, 6, 8, 8, 12],
                       ListNode.toArray(by: l3))
        
    }
    
    func testMergeKLists() {
        let l1 = ListNode.toNodeList(by: [1, 2])
        let l2 = ListNode.toNodeList(by: [3, 4])
        let l3 = ListNode.toNodeList(by: [1, 2, 3, 4, 5, 6])
        let array = [l1, l2, l3]
        let l4 = testObj.mergeKLists(array)
        let res = ListNode.toArray(by: l4)
        XCTAssertEqual(res, [1, 1, 2, 2, 3, 3, 4, 4, 5, 6])
        
    }
}
// swiftlint:enable type_body_length
