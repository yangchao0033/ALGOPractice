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
            guard let root = root else { return [] }
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

    /*
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    */

}
