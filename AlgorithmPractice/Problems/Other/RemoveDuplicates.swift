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
        guard nums.count > 1 else { return nums.count }
        var slow = 0
        for i in 0..<nums.count {
            if nums[i] != nums[slow] {
                slow += 1
                nums[slow] = nums[i]
            }
        }
        return slow + 1
    }
}
