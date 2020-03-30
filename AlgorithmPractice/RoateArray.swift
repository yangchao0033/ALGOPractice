//
//  roateArray.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/30.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class RoateArray {
    func roate(_ nums: inout [Int], _ k: Int) {
            // 1. 暴力法
    //        for _ in 0..<k {
    //            var lastItem = nums[nums.count - 1]
    //            for i in 0..<nums.count {
    //                let temp = nums[i]
    //                nums[i] = lastItem
    //                lastItem = temp
    //            }
    //        }
            // 2. 数组拷贝（取模索引）
    //        var buffer = [Int](repeating: 0, count: nums.count)
    //        for i in 0..<nums.count {
    //            buffer[(i + k) % nums.count] = nums[i]
    //        }
    //        for j in 0..<nums.count {
    //            nums[j] = buffer[j]
    //        }
            // 3. 环状替换(先忽略)
    //        let n = nums.count
    //        let k = k % nums.count
    //        var count = 0
    //        var start = 0
    //        print("origin: \(nums)\n\n")
    //        while count < n {
    //            var current = start
    //            var pre = nums[start]
    //            print("start: \(start) | current: \(current) | prev: \(pre)\n")
    //            repeat {
    //                let next = (k + current) % n
    //                let temp = nums[next]
    //                nums[next] = pre
    //                pre = temp
    //                current = next
    //                count += 1
    //                print("start: \(start) | current: \(current) | prev: \(pre)")
    //                print("swap after: \(nums)")
    //            } while current != start
    //            start += 1
    //        }
            // 4. 大小反转
    //        reverseArray(array: &nums, left: 0, right: nums.count - 1)
    //        reverseArray(array: &nums, left: 0, right: k - 1)
    //        reverseArray(array: &nums, left: k, right: nums.count - 1)
        }
        func reverseArray(array: inout [Int], left: Int, right: Int) {
            var left = left
            var right = right
            while left < right {
                let temp = array[right]
                array[right] = array[left]
                array[left] = temp
                left += 1
                right -= 1
            }
        }
}
