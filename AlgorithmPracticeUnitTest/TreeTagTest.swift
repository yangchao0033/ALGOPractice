//
//  TreeTagTest.swift
//  AlgorithmPracticeUnitTest
//
//  Created by 超杨 on 2020/9/5.
//  Copyright © 2020 superYang. All rights reserved.
//

import XCTest

class TreeTagTest: XCTestCase {

    let testObj = TreeTags()
    
    func testMaxDepth() {
        let n1 = NTreeNode(1)
        let n2 = NTreeNode(2)
        let n3 = NTreeNode(3)
        n1.children = [n2]
        n2.children = [n3]
        let res = testObj.maxDepth(n1)
        XCTAssertEqual(res, 3)
    }
    
    func testSumNumbers() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        node1.left = node2
        node1.right = node3
        let res = testObj.sumNumbers(node1)
        XCTAssertEqual(25, res)
    }
    
    func testSumNumbers1() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(0)
        node1.left = node2
        let res = testObj.sumNumbers(node1)
        XCTAssertEqual(10, res)
    }

    func testSumNumbers2() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(9)
        node1.right = node2
        let res = testObj.sumNumbers(node1)
        XCTAssertEqual(19, res)
    }
}
