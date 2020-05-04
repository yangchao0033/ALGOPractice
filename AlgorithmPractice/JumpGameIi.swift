//
// Created by 超杨 on 2020/5/4.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

class JumpGameIi {
//        Input: [2,3,1,1,4]
//        Output: 2
//        Explanation: The minimum number of jumps to reach the last index is 2.
//        Jump 1 step from index 0 to 1, then 3 steps to the last index.
    func jump(_ nums: [Int]) -> Int {
        var end = 0 // 最大边界
        var maxPosition = 0 // 找到最大可跳跃位置
        var step = 0
        for index in (0..<nums.count - 1) {
            maxPosition = max(maxPosition, nums[index] + index) // 遍历每个位置，并计算每个位置能跳跃的位置，并记录最大位置
            if index == end { // 当遍历索引和边界重合时，重置边界为最大位置，并记录跳跃步数
                end = maxPosition
                step += 1
            }
        }
        return step
    }
}
