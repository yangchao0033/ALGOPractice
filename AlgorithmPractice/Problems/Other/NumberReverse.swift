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
        var x = x
        var res = 0
        while x != 0 {
            let mod = x % 10 // 得出末尾数字
            x /= 10 // 剔除末尾
            res = res * 10 + mod // 逆序求职
        }
        return abs(res) > Int32.max ? 0 : res
    }
}
