//
//  ThreeSum.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/25.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class ThreeSum: NSObject {
    // 暴力法：有问题，元素可能会重复出现 O(n^3)
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        for i in 0..<nums.count - 2 {
            for j in i+1..<nums.count - 1 {
                for k in j+1..<nums.count where nums[i] + nums[j] + nums[k] == 0 {
                    res.append([nums[i], nums[j], nums[k]])
                }
            }
        }
        return res
    }
    // 三指针法：
    // 1. 先对数组排序，方便后面做去重
    // 2. 设立 k, i, j 三个指针， k<i<j 且 k从最小开始 i 和 j 分别从 k+1 和 length - 1两边夹逼
    // 3. 当 nums[k] > 0 时，循环结束
    // 4. 当 k > 0 且 nums[k] == nums[k-1] 跳过此元素，否则会得到重复的
    // 5. 循环求三数之和
        // s < 0 i++ && 循环去重
        // s > 0 j-- && 循环去重
        // s == 0 添加到结果&& i++ && 循环去重 && j-- && 循环去重
    func threeSum1(_ nums: [Int]) -> [[Int]] {
        let count = nums.endIndex
        guard count >= 3 else { return [] }
        var numbers = nums
        numbers.sort()
        var res = [[Int]]()
        for k in 0..<count {
            var i = k + 1
            var j = count - 1
            if k > 0 && numbers[k] == numbers[k - 1] { continue }
            while i < j {
                guard numbers[k] <= 0 else { break }
                let threeSum = numbers[k] + numbers[i] + numbers[j]
                if threeSum < 0 {
                    i = leftIndexByMove(leftBar: i, rightBar: j, nums: numbers)
                } else if threeSum > 0 {
                    j = rightIndexByMove(leftBar: i, rightBar: j, nums: numbers)
                } else {
                    res.append([numbers[k], numbers[i], numbers[j]])
                    i = leftIndexByMove(leftBar: i, rightBar: j, nums: numbers)
                    j = rightIndexByMove(leftBar: i, rightBar: j, nums: numbers)
                }
            }
        }
        return res
    }
    private func leftIndexByMove(leftBar: Int, rightBar: Int, nums: [Int]) -> Int {
        return indexByMoveLeftOrRight(isLeft: true, leftBar: leftBar, rightBar: rightBar, nums: nums)
    }
    private func rightIndexByMove(leftBar: Int, rightBar: Int, nums: [Int]) -> Int {
        return indexByMoveLeftOrRight(isLeft: false, leftBar: leftBar, rightBar: rightBar, nums: nums)
    }
    private func indexByMoveLeftOrRight(isLeft: Bool, leftBar: Int, rightBar: Int, nums: [Int]) -> Int {
        let offset = isLeft ? 1 : -1
        var moveItem = isLeft ? leftBar : rightBar
        moveItem += offset
        while true {
            let condition = (isLeft ? moveItem < rightBar : leftBar < moveItem)
                    && nums[moveItem] == nums[moveItem - offset]
            guard condition else { break }
            moveItem += offset
        }
        return moveItem
    }
}
