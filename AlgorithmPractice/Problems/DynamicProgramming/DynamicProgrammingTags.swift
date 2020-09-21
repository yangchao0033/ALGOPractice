//
//  DynamicProgrammingTags.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/9/21.
//  Copyright © 2020 superYang. All rights reserved.
//

import Foundation

class DynamicProgrammingTags {
    func longestPalindrome(_ s: String) -> String {
        // 暴力算法
        let n = s.count
        guard n >= 2 else { return s }
        
        var maxLength = 1
        var begin = 0
        let chars = Array(s)
        // 枚举所有长度严格大于 1 的子串 chars[i..j]
        for i in 0..<n - 1 {
            for j in i + 1..<n {
                if j - i + 1 > maxLength && validHelper(chars, i, j) {
                    maxLength = j - i + 1
                    begin = i
                }
            }
        }
        return String(chars[begin..<(begin + maxLength)])
        
        // 动态规划
        // dp(i, j) = s[i] == s[j] && dp(i + 1, j - 1)
//        let n = s.count
//        guard n >= 2 else {
//            return s
//        }
//        var maxLength = 1
//        var begin = 0
//        var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
//        // 对角线都为 true（因为单个字符必定为回文序列）
//        for i in 0..<n {
//            dp[i][i] = true
//        }
//        let chars = Array(s)
//        for j in 1..<n { // 对角线已经处理，所以列从 1 开始
//            for i in 0..<j { // 对角线以下不用管，所以只到 j 就结束了
//                if chars[i] != chars[j] {
//                    dp[i][j] = false
//                } else {
//                    dp[i][j] = j - i < 3 || dp[i + 1][j - 1] // 简化为 1 行，等同于下面 5 行
////                    if j - 1 - (i + 1) + 1 < 2 { // 表示 j - 1 到 i + 1 之间没有字符或只有一个字符，则肯定是回文串
////                        dp[i][j] = true
////                    } else {
////                        dp[i][j] = dp[i + 1][j - 1] // 状态转移，更里面的子串会优先计算出回文性质
////                    }
//                }
//                if dp[i][j] && j - i + 1 > maxLength { // 如果状态正确且长度大于原先的最大长度，则对 begin 和 maxLength 进行更新
//                    maxLength = j - i + 1
//                    begin = i
//                }
//            }
//        }
//        return String(chars[begin..<(begin+maxLength)])
    }
    
    func validHelper(_ arr: [Character], _ i: Int, _ j: Int) -> Bool {
        var i = i
        var j = j
        while i < j {
            if arr[i] != arr[j] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
}
