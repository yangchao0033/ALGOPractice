//
//  AlgorithmPracticeUnitTest.swift
//  AlgorithmPracticeUnitTest
//
//  Created by 超杨 on 2020/5/3.
//  Copyright © 2020 superYang. All rights reserved.
//

import XCTest

class AlgorithmPracticeUnitTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
//        ClassNameHelper.classNamePasteGet()
    }

/*
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
 */
    func testMaximumSubarray() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertTrue(MaximumSubarray().maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6)
        XCTAssertTrue(MaximumSubarray().maxSubArray([1]) == 1)
    }

    func testJumpGameIi() throws {
        XCTAssertTrue(JumpGameIi().jump([2, 3, 1, 1, 4]) == 2)
    }

    func testTreeNodeSerializeAndDeserialize() throws {
        let root = TreeNode(5)
        let root1 = TreeNode(4)
        root1.left = TreeNode(3)
        root1.right = TreeNode(6)
        root.left = TreeNode(1)
        root.right = root1
        let str = TreeNode.serialize(root)
        XCTAssertTrue(str == "[5,1,null,null,4,3,null,null,6,null,null]")
        let newRoot = TreeNode.deserialize(str)
        XCTAssertNotNil(newRoot)

        func inorderTraversal(_ root: TreeNode?) -> [Int] {
            guard let root = root else {
                return []
            }
            return [root.val] + inorderTraversal(root.left) + inorderTraversal(root.right)
        }

        let t1 = inorderTraversal(root)
        let t2 = inorderTraversal(newRoot)
        XCTAssertTrue(t1 == t2)
    }

    func testValidateBinarySearchTree() {
        let root = TreeNode.deserialize("[2,1,null,null,3,null,null]")
        XCTAssertTrue(ValidateBinarySearchTree().isValidBST(root))
        let root1 = TreeNode.deserialize("[5,1,null,null,4,3,null,null,6,null,null]")
        XCTAssertFalse(ValidateBinarySearchTree().isValidBST(root1))
        XCTAssertTrue(ValidateBinarySearchTree().isValidBST(nil))
    }

    func testConvertSortedArrayToBinarySearchTree() throws {
        let array = [-10, -3, 0, 5, 9]
        let root = ConvertSortedArrayToBinarySearchTree().sortedArrayToBST(array)
        let str = TreeNode.serialize(root)
        XCTAssertTrue(str == "[0,-3,-10,null,null,null,9,5,null,null,null]")
    }
    
    func testSubtreeOfAnotherTree() throws {
        let s = TreeNode.deserialize("[3,4,1,null,null,2,null,null,5,null,null]")
        let t = TreeNode.deserialize("[4,1,null,null,2,null,null]")
        XCTAssertTrue(SubtreeOfAnotherTree().isSubtree(s, t))

        let s1 = TreeNode.deserialize("[3,4,1,null,null,2,0,null,null,null,5,null,null]")
        let t1 = TreeNode.deserialize("[4,1,null,null,2,null,null]")
        XCTAssertFalse(SubtreeOfAnotherTree().isSubtree(s1, t1))
    }

    func testSameTree() {
        let s = TreeNode.deserialize("[3,4,1,null,null,2,null,null,5,null,null]")
        let t = TreeNode.deserialize("[3,4,1,null,null,2,null,null,5,null,null]")
        XCTAssertTrue(SameTree().isSameTree(s, t))
        let s1 = TreeNode.deserialize("[3,4,1,null,null,2,0,null,null,null,5,null,null]")
        XCTAssertFalse(SameTree().isSameTree(s, s1))
    }

    func testSqrtx() {
        let res =  Sqrtx().mySqrt(6)
        XCTAssertTrue(res == 2)

        let res1 =  Sqrtx().mySqrt(1)
        XCTAssertTrue(res1 == 1)

        let res2 =  Sqrtx().mySqrt(0)
        XCTAssertTrue(res2 == 0)
    }
    
    func testMergeSortedList() {
        let a1 = [0, 2, 4, 6, 8]
        let a2 = [1, 3, 4, 6, 8, 12]
        let l1 = ListNode.toNodeList(by: a1)
        let l2 = ListNode.toNodeList(by: a2)
        let l3 = MergeTwoSortedLists().mergeTwoLists(l1, l2)
        XCTAssertEqual([0, 1, 2, 3, 4, 4, 6, 6, 8, 8, 12],
                       ListNode.toArray(by: l3))
        if true {
            let l1 = ListNode.toNodeList(by: a1)
            let l2 = ListNode.toNodeList(by: a2)
            let l4 = MergeTwoSortedLists().mergeTwoLists3(l1, l2)
            XCTAssertEqual([0, 1, 2, 3, 4, 6, 8, 12],
            ListNode.toArray(by: l4))
        }
        
        if true {
            let l1 = ListNode.toNodeList(by: a1)
            let l2 = ListNode.toNodeList(by: a2)
            let l5 = MergeTwoSortedLists().intersectionList1(l1, l2)
            XCTAssertEqual([4, 6, 8],
            ListNode.toArray(by: l5))
        }
        
    }
    
    func testReverseList() {
        let a1 = [1, 3, 4, 6, 8, 12]
        let l1 = ListNode.toNodeList(by: a1)
        let l2 = ReverseList().reverseList1(l1)
        XCTAssertEqual([12, 8, 6, 4, 3, 1],
        ListNode.toArray(by: l2))
    }

    /*
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    */

}
