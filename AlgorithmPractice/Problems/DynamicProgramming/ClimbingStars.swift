//
//  CombineStars.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/25.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class ClimbingStars {
    // 法一：斐波那契额求和公式
    // 法二：暴力递归/缓存递归 (正向反向皆可，0...n | n...0)
    // 法三：动态规划
    func climStars(_ n: Int) -> Int {
        // 解法一：斐波那契通项公示 O(logn)
        // 由于比斐波那契数列少 1
//        let index = Double(n + 1)
//        let sqrtFive = sqrt(5)
//        let fibN = (pow((1 + sqrtFive) / 2, index) - pow((1 - sqrtFive) / 2, index)) / sqrtFive
//        return Int(fibN)
        // 解法二：递归
        // a. 暴力递归
        //        func climbHelper(_ n: Int) -> Int {
//            if n == 1 {
//                return 1
//            }
//            if n == 2 {
//                return 2
//            }
//            return climbHelper(n - 1) + climbHelper(n - 2)
//        }
//        return climbHelper(n)
        // b. 缓存递归
        //        func climbHelper(_ n: Int, _ cache: inout [Int]) -> Int {
//            if n == 1 {
//                return 1
//            }
//            if n == 2 {
//                return 2
//            }
//            if cache[n] != -1 {
//                return cache[n]
//            }
//            cache[n] = climbHelper(n - 1, &cache) + climbHelper(n - 2, &cache)
//            return cache[n]
//        }
//        var cache = [Int](repeating: -1, count: n + 1)
//        return climbHelper(n, &cache)
        // 解法三：动态规划
        // a. 辅助数组
//        guard n != 1 && n != 2 else {
//            return n
//        }
//        var array = [Int](repeating: 0, count: n + 1)
//        array[1] = 1
//        array[2] = 2
//        for i in 3..<array.count {
//            array[i] = array[i - 1] + array[i - 2]
//        }
//        return array[n]
        // b. 临时变量
        guard n != 1 && n != 2 else { return n }
        var first = 1
        var second = 2
        for _ in 3...n {
            (first, second) = (second, first + second) // 使用元组进行数值交换
        }
        return second
    }
}
