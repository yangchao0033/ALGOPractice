//
//  IntervalMerge.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/16.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class IntervalMerge {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard !intervals.isEmpty else { return [] }
        var res = [[Int]](repeating: [0, 0], count: intervals.count)
        let sorted = intervals.sorted { $0[0] < $1[0] }
        var idx = -1
        for item in sorted {
            if idx == -1 || res[idx][1] < item[0] {
                idx += 1
                res[idx] = item
            } else {
                res[idx][1] = max(res[idx][1], item[1])
            }
        }
        return [[Int]](res[0...idx])
    }
}
