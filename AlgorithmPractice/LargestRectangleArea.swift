//
//  LargestRectangleArea.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/1.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class LargestRectangleArea: NSObject {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        // 1. 暴力 O(n^2) 超时 无法使用
        //        var maxArea = 0
        //        for i in 0..<heights.count {
        //            var minHeight = Int.max
        //            for j in i..<heights.count {
        //                minHeight = min(minHeight, heights[j])
        //                maxArea = max(maxArea, minHeight * (j - i + 1))
        //            }
        //        }
        //        return maxArea
        // 2. 单调栈 O(n)
        var heights = heights // 可变
        heights.insert(0, at: 0)
        heights.append(0)
        var maxArea = 0
        var stack = Stack<Int>()
        for i in 0..<heights.count {
            // 如果 stack 不为空且 heights[i] >= 栈顶元素索引对应的值，则进行面积计算和出栈
            while !stack.isEmpty && heights[i] < heights[stack.peek!] {
                if let cur = stack.pop() {
                    maxArea = max(maxArea, (i - stack.peek! - 1) * heights[cur])
                }
            }
            stack.push(i)
        }
        return maxArea
    }
}
