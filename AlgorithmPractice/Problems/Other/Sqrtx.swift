//
// Created by 超杨 on 2020/5/9.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

class Sqrtx {
    func mySqrt(_ x: Int) -> Int {
        // 极度精简
//        var left = 0
//        var right = x
//        while left < right {
//            let mid = (left + right + 1) / 2
//            let x2 = mid * mid
//            if x2 <= x {
//                left = mid
//            } else {
//                right = mid - 1
//            }
//        }
//        return left
    // 常规解法
        var left = 0
        var right = x
        while left <= right {
//            let mid = (left + right) / 2
            let mid = left + (right - left) >> 1 // 为了防止溢出和高效，更推荐这样写
            let sqrt = mid * mid
            let nextSqrt = (mid + 1) * (mid + 1)
            if sqrt == x || (sqrt < x && nextSqrt > x ) {
                return mid
            } else if sqrt < x {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return 0
    }
}
