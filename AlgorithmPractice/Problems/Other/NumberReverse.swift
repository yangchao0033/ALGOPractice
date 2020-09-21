//
//  NumberReverse.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/17.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class NumberReverse: NSObject {
    func reverse(_ x: Int) -> Int {
            // 字符串暴力
    //        let flag = x < 0 ? -1 : 1
    //        let str = String(x * flag)
    //        let reversed = Int(String(str.reversed()))!
    //        return reversed > Int32.max ? 0 : reversed * flag
            // 使用公式
            var num = x
            var res = 0
            while num != 0 {
                let a = num % 10
                num /= 10
                res = res * 10 + a
            }
            return abs(res) > Int32.max ? 0 : res
        }
}
