//
//  TrappingRainWater.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/6.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class TrappingRainWater: NSObject {
    func trap(_ heights: [Int]) -> Int {
        var sumArea = 0
        var stack = Stack<Int>()
        for i in 0..<heights.count {
            while !stack.isEmpty && heights[stack.peek!] < heights[i] {
                let top = stack.pop()!
                if stack.isEmpty {
                    break
                }
                let minHeight = min(heights[stack.peek!], heights[i])
                let area = (minHeight - heights[top]) * (i - stack.peek! - 1)
                sumArea += area
            }
            stack.push(i)
        }
        return sumArea
    }
}
