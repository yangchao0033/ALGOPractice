//
// Created by 超杨 on 2020/4/23.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

class WasToChange {
    // 换零钱
    func wasToChange(_ n: Int) -> Int {
        var dp = [Int](repeating: 0, count: n + 1)
        let coins = [1, 5, 10, 25]
        dp[0] = 1
        for coin in coins {
            if coin > n { continue }
            for i in coin...n {
                dp[i] = (dp[i] + dp[i - coin])
            }
        }
        return dp[n] % 1000000007
    }
}
