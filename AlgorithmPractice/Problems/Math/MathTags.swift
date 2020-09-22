//
//  MathTags.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/9/21.
//  Copyright © 2020 superYang. All rights reserved.
//

import Foundation

class MathTags {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        var reverseNumber = 0
        var x = x
        while reverseNumber < x {
            reverseNumber = reverseNumber * 10 + x % 10
            x /= 10
        }
        return reverseNumber == x || x == reverseNumber / 10
    }
    
    // 字符串转整数
    func myAtoi(_ str: String) -> Int {
        let chars = Array(str)
        let n = chars.count
        var idx = 0
        while idx < n && chars[idx] == " " {
            idx += 1 // 去空格
        }
        if idx == n {
            return 0
        }
        // 处理符号
        var sign = 1
        if chars[idx] == "-" {
            sign = -1
            idx += 1
        } else if chars[idx] == "+" {
            idx += 1
        } else if !(chars[idx].isASCII && chars[idx].isWholeNumber) {
            return 0
        }
        var ans = 0
        while idx < n {
            if !(chars[idx].isASCII && chars[idx].isWholeNumber) {
                break
            }
            let digit = chars[idx].wholeNumberValue!
            if ans > (Int(Int32.max) - digit) / 10 {
                return Int(sign > 0 ? Int32.max : Int32.min)
            }
            ans = ans * 10 + digit
            idx += 1
        }
        return ans * sign
    }
    
    // 最长公共前缀
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else { return "" }
        var ans = Array(strs[0])
        for i in 1..<strs.count {
            let chars = Array(strs[i])
            var count = 0
            for j in 0..<min(chars.count, ans.count) {
                if ans[j] != chars[j] {
                    break
                }
                count += 1
            }
            ans = Array(ans[0..<count])
            if ans.isEmpty {
                return ""
            }
        }
        return String(ans)
    }
    
    // 三数之和等于0
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        let n = nums.count
        guard n >= 3 else { return ans }
        var a = nums
        a.sort() // 一定记住要排序
        for i in 0..<n {
            guard a[i] <= 0 else { break } // 1. 第一个数一定小于等于0
            if i > 0 && a[i] == a[i - 1] { continue } // 2. 去重
            var lb = i + 1
            var rb = n - 1
            while lb < rb {
                let sum = a[i] + a[lb] + a[rb]
                if sum == 0 {
                    ans.append([a[i], a[lb], a[rb]])
                    while lb < rb && a[lb] == a[lb + 1] { lb += 1 } // 左边界去重
                    while lb < rb && a[rb] == a[rb - 1] { rb -= 1 } // 右边界去重
                    lb += 1
                    rb -= 1
                } else if sum < 0 {
                    lb += 1 // 调平
                } else {
                    rb -= 1 // 调平
                }
            }
        }
        return ans
    }
    
    // 最接近的三数之和
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        guard n >= 3 else { return 0 }
        var a = nums
        a.sort()
        var res = a[0] + a[1] + a[2]
        for i in 0..<n {
            var l = i + 1
            var r = n - 1
            while l < r {
                let sum = a[i] + a[l] + a[r]
                if abs(sum - target) < abs(res - target) {
                    res = sum
                }
                if sum > target {
                    r -= 1
                } else if sum < target {
                    l += 1
                } else {
                    return sum
                }
            }
        }
        return res
    }
}
