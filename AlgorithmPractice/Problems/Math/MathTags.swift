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
}
