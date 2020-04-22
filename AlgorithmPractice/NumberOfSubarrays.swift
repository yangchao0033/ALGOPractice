//
// Created by 超杨 on 2020/4/21.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

class NumberOfSubarrays {
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        // 法一 滑动窗口
        // a. 构造奇数索引数组，并在左右追加边界
        // b. 遍历构造出的数组，并滑动窗口计算两边可触达的子串个数
        var feed = 0
        var res = 0
        var array = [Int](repeating: 0, count: nums.count + 2) // 存储索引
        for i in 0..<nums.count where (nums[i] & 1) == 1 {
            feed += 1
            array[feed] = i
        }
        array[0] = -1
        array[feed + 1] = nums.count
        var i = 1
        while i + k < feed + 2 {
            res += (array[i] - array[i - 1]) * (array[i + k] - array[i + k - 1])
            i += 1
        }
        return res
    }
}
