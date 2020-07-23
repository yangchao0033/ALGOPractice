//
// Created by 超杨 on 2020/4/27.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

class SearchInRotatedSortedArray {
    func search(_ nums: [Int], _ target: Int) -> Int {
        // 二分搜索 + 边界探测 4 5 6 7 0 1 2 3
        let n = nums.count
        guard n != 0 else {
            return 0
        }
        var left = 0
        var right = n - 1
        while left <= right {
            let mid = right + left / 2
            if nums[mid] == target {
                return mid
            }
            if nums[left] < nums[mid] {
                if nums[left] <= target && target <= nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                if nums[mid] <= target && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return -1
    }
}
