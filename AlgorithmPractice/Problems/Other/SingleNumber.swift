//
// Created by 超杨 on 2020/4/29.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

class SingleNumber {
    func singleNumber(_ nums: [Int]) -> Int {
        var res = 0
        for item in nums {
            res ^= item
        }
        return res
    }
}
