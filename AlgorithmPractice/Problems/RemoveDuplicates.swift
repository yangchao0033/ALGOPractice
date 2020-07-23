//
//  RemoveDuplicates.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/29.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class RemoveDuplicates {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var p = 0
        var q = 1
        while q < nums.count {
            if nums[p] != nums[q] {
                    nums[p + 1] = nums[q]
                    p += 1
            }
            q += 1
        }
        return p + 1
    }
}
