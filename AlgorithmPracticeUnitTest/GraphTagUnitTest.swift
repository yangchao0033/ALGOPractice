//
//  GraphTagUnitTest.swift
//  AlgorithmPracticeUnitTest
//
//  Created by 超杨 on 2020/9/12.
//  Copyright © 2020 superYang. All rights reserved.
//

import XCTest

class GraphTagUnitTest: XCTestCase {

    let testObj = GraphTags()
    
    func testFindJudge() {
        let res = testObj.findJudge(2, [[1, 2]])
        XCTAssertEqual(res, 2)
        
        let res2 = testObj.findJudge(1, [])
        XCTAssertEqual(res2, 1)
    }

}
