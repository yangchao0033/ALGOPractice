//
//  ALGOHelper.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/5/4.
//  Copyright © 2020 superYang. All rights reserved.
//

import XCTest

class ALGOHelper: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testClassNameHelper() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // 测试成功case
        let pb = NSPasteboard.general
        pb.clearContents()
        let testStr = "https://leetcode-cn.com/problems/jump-game-ii/solution/"
        let success =  pb.setString(testStr, forType: .string)
        ClassNameHelper.classNamePasteGet()
        let content: String? = pb.readObjects(forClasses: [NSString.self], options: nil)?.first as? String
        XCTAssertTrue(success && content == "JumpGameIi") //
        // 测试异常case
        pb.clearContents()
        let testStr2 = "https://baidu.com"
        let success2 =  pb.setString(testStr2, forType: .string)
        ClassNameHelper.classNamePasteGet()
        let content2: String? = pb.readObjects(forClasses: [NSString.self], options: nil)?.first as? String
        XCTAssertTrue(content2 == testStr2)
    }

}
