//
// Created by 超杨 on 2020/4/28.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

class ShuZuZhongShuZiChuXianDeCiShuLcof {
    func singleNumbers(_ nums: [Int]) -> [Int] {
        // 暴力法: hash 统计次数
        var dict = [Int: Int]()
        for item in nums {
            if let count = dict[item] {
                dict[item] = count + 1
            } else {
                dict[item] = 1
            }
        }
        var arr = [Int]()
        for (key, value) in dict where value == 1 {
            arr.append(key)
        }
        return arr
    }
}
