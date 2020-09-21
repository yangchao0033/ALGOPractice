//
//  CanJump.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/17.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class CanJump: NSObject {
    func canJump(_ nums: [Int]) -> Bool {
        // 贪心算法
        var k = 0
        for (idx, num) in nums.enumerated() {
            // 当发现上次可跳的最远位置比当前索引小时，说明永远都无法跳完
            if k < idx {
                return false
            }
            k = max(k, idx + num) // 计算当前可跳跃最大距离
        }
        return true
    }
}
