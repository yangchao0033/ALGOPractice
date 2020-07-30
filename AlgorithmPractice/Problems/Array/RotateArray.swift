//
//  roateArray.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/30.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class RotateArray {
    func rotate(_ nums: inout [Int], _ k: Int) {
        // 1. 暴力法
        //        let n = nums.count
        //        let k = k % n
        //        for _ in 0..<k {
        //            var last = nums[n - 1]
        //            for j in 0..<n {
        //                let temp = nums[j]
        //                nums[j] = last
        //                last = temp
        //            }
        //        }
        // 2. 数组拷贝（取模索引）
        //        guard k != 0 else { return }
        //        let n = nums.count
        //        let k = k % n
        //        let temp = nums
        //        for i in 0..<n {
        //            nums[(i + k) % n] = temp[i]
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
        guard k != 0 else { return }
        let n = nums.count
        let k = k % n
        reverse(array: &nums, left: 0, right: n - 1)
        reverse(array: &nums, left: 0, right: k - 1)
        reverse(array: &nums, left: k, right: n - 1)
        
    }
    func reverse(array: inout [Int], left: Int, right: Int) {
        var left = left
        var right = right
        while left < right {
            let temp = array[left]
            array[left] = array[right]
            array[right] = temp
            left += 1
            right -= 1
        }
    }
    
}
