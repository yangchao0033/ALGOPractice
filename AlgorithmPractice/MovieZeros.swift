//
//  MovieZeros.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/24.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class MovieZeros {
    // 输入: [0,1,0,3,12]
    // 输出: [1,3,12,0,0]
    // 1. 暴力求解
    func moveZeros0(_ nums: inout [Int]) {
        // 1. 记录非0元素并全部赋值到前排
        // 2. 剩余位置补齐 0
        var lastNonZeroIndex = 0
        for index in 0..<nums.count where nums[index] != 0 {
            nums[lastNonZeroIndex] = nums[index]
            lastNonZeroIndex += 1
        }
        for index in lastNonZeroIndex..<nums.count {
            nums[index] = 0
        }
        // 提都不要提：时间复杂度为 O（n + m）
//        nums.replaceSubrange(
//            lastNonZeroIndex..<nums.count,
//            with: Array(repeating: 0, count: nums.count - lastNonZeroIndex))
    }
    // 2. 指针交换法
    func moveZeros1(_ nums: inout [Int]) {
        // 1. 设定两个快慢指针，快指针依次遍历，
        // 2 .当快指针发现非0元素时与慢指针交换值，
        // 并累加慢指针（表示之前的所有元素已非0）
        var lastNonZeroAt = 0
        for cur in 0..<nums.count where nums[cur] != 0 {
            nums.swapAt(cur, lastNonZeroAt)
            lastNonZeroAt += 1
        }
    }
    // 3. 指针 + 手写交换
    func moveZeros2(_ nums: inout [Int]) {
        var lastNoZeroIndex = 0
        //        for cur in 0..<nums.count where nums[cur] != 0 {
        //            let temp = nums[cur]
        //            nums[cur] = nums[lastNoZeroIndex]
        //            nums[lastNoZeroIndex] = temp
        //            lastNoZeroIndex += 1
        //        }
        for cur in 0..<nums.count where nums[cur] != 0 {
            let temp = nums[cur]
            nums[cur] = nums[lastNoZeroIndex]
            nums[lastNoZeroIndex] = temp
            lastNoZeroIndex += 1
        }
    }
}
