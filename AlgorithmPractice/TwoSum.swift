//
//  TwoSum.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/30.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class TwoSum {
    func towSum(_ nums: [Int], _ target: Int) -> [Int] {
            // 1. 暴力法 O(n^2)
    //        for i in 0..<nums.count {
    //            for j in i + 1..<nums.count {
    //                if nums[i] + nums[j] == target {
    //                    return [i, j]
    //                }
    //            }
    //        }
    //        return [0, 0]
            // 2. Set 法 O(n^2)
    //        var set: Set<Int> = []
    //        for i in 0..<nums.count {
    //            let otherNum = target - nums[i]
    //            if set.contains(otherNum) {
    //                if let otherIndex = nums.firstIndex(of: otherNum) {
    //                    return [otherIndex, i]
    //                }
    //            }
    //            set.insert(nums[i])
    //        }
    //        return [0, 0]
            // 3. 两遍 Dictionary
    //        var dictionary = [Int: Int]()
    //        for i in 0..<nums.count {
    //            dictionary[nums[i]] = i
    //        }
    //        for j in 0..<nums.count {
    //            let otherNunber = target - nums[j]
    //            if let secondNumberIndex = dictionary[otherNunber] {
    //                if secondNumberIndex != j {
    //                    return [j, secondNumberIndex]
    //                }
    //            }
    //        }
    //        return [0, 0]
            // 4. Dictionary 法
            var dictionary = [Int: Int]()
            for i in 0..<nums.count {
                if let index = dictionary[target - nums[i]] {
                    return [index, i]
                }
                dictionary[nums[i]] = i
            }
            return [0, 0]
        }
}
