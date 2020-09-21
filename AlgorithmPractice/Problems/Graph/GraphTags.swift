//
//  GraphTags.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/9/12.
//  Copyright © 2020 superYang. All rights reserved.
//

import Foundation

// swiftlint:disable identifier_name
class GraphTags {
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        var cnt = [Int](repeating: 0, count: N + 1)
        for t in trust {
            cnt[t[0]] -= 1
            cnt[t[1]] += 1
        }
        for i in 1..<N + 1 where cnt[i] == N - 1 {
            return i
        }
        return -1
    }
}
// swiftlint:enable identifier_name
