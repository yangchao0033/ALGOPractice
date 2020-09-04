//
//  TestDSString.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/8/24.
//  Copyright © 2020 superYang. All rights reserved.
//

import XCTest

class TestDSString: XCTestCase {
    func testBruteForceStringSearch() {
        let s = "The big dog jumped over the fox"
        if let index = s.indexOf("ump") {
            let res: String.Index? = s.firstIndex(of: "u")
            XCTAssertEqual(res, index)
        }
        let animals = "🐶🐔🐷🐮🐱"
        if let index = animals.indexOf("🐮") {
            let res: String.Index? = animals.firstIndex(of: "🐮")
            XCTAssertEqual(index, res)
        }
    }

    func testRabinKarp() {
        XCTAssertEqual(String.search(text: "The big dog jumped over the fox", pattern: "ump"), 13)
        XCTAssertEqual(String.search(text: "The big dog jumped over the fox", pattern: "missed"), -1)
        XCTAssertEqual(String.search(text: "The big dog jumped over the fox", pattern: "T"), 0)
        XCTAssertEqual(String.search(text: "🐶🐔🐷🐮🐱", pattern: "🐮🐱"), 3)
    }

    func testBMSearch() {
        let s = "The big dog jumped over the fox"
        let res = s.firstIndex(of: "u")
        let ans = s.bfIndex(of: "ump")
        XCTAssertEqual(res, ans)

        let animals = "🐶🐔🐷🐮🐱"
        let res1 = animals.firstIndex(of: "🐮")
        let ans1 = animals.bfIndex(of: "🐮🐱")
        XCTAssertEqual(ans1, res1)
    }
}
