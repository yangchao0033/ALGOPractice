//
// Created by 超杨 on 2020/4/30.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

class HappyNumber {
    var set: Set<Int> = []
    func isHappy(_ n: Int) -> Bool {
        // 1. 逐位求平方和 + 递归 + HashSet 查环
//        var cur = n
//        var res = 0
//        while cur > 0 {
//            let mod = cur % 10
//            res += mod * mod
//            cur /= 10
//        }
//        if res == 1 {
//            return true
//        } else if set.contains(n) {
//            return false
//        } else {
//            set.insert(n)
//            return isHappy(res)
//        }
        // 法二：快慢指针
        var fast = n
        var slow = n
        repeat {
            slow = squareSum(slow)
            fast = squareSum(fast)
            fast = squareSum(fast)
        } while slow != fast
        return fast == 1
    }
    func squareSum(_ n: Int) -> Int {
        var sum = 0
        var n = n
        while n > 0 {
            let mod = n % 10
            sum += mod * mod
            n /= 10
        }
        return sum
    }
}
