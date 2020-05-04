//
// Created by 超杨 on 2020/5/3.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

class MaximumSubarray {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        // 动态规划
        var res = nums[0]
        var sum = 0
        for num in nums {
            if sum > 0 { // sum + num > num
                sum += num
            } else {
                sum = num
            }
            res = max(sum, res)
        }
        return res
        // 分治
    }
}
