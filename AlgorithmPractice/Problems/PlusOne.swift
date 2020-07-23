//
//  PlusOne.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/30.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class PlusOne {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        for i in (0..<digits.count).reversed() {
            digits[i] = (digits[i] + 1) % 10
            if digits[i] != 0 {
                return digits
            }
        }
        digits.insert(1, at: 0)
        return digits
    }
}
