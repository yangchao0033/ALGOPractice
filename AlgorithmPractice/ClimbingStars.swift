//
//  CombineStars.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/25.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class ClimbingStars {
    // 解法一：斐波那契通项公示 O(logn)
    func climStars(_ n: Int) -> Int {
        // 由于比斐波那契数列少 1
        let index = Double(n + 1)
        let sqrtFive = sqrt(5)
        let fibN = (pow((1 + sqrtFive) / 2, index) - pow((1 - sqrtFive) / 2, index)) / sqrtFive
        return Int(fibN)
    }
    // 解法二：斐波那契迭代求和，并使用额外空间 时间 O(n) 空间 O(n)
    func climStars1(_ n: Int) -> Int {
        guard n != 0 else {
            return 0
        }
        guard n != 1 else {
            return 1
        }
        guard n != 2 else {
            return 2
        }
        // 填充一个数组
        var array = [Int](repeating: 0, count: n + 1)
        array[1] = 1
        array[2] = 2
        for index in 3...n {
            array[index] = array[index - 1] + array[index - 2]
        }
        return array[n]
    }
    // 解法三：整体同二，但不开辟新空间 时间 O(n) 空间 O(1)
    func climStars2(_ n: Int) -> Int {
        guard n > 2 else { return n }
        var fn = 0, f1 = 1, f2 = 2
        for _ in 3...n {
            fn = f1 + f2
            f1 = f2
            f2 = fn
        }
        return fn
    }
}
