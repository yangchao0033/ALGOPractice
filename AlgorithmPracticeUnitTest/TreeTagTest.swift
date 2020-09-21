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

}
