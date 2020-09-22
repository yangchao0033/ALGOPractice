//
//  MaxWaterArea.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/24.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class MaxWaterArea: NSObject {
    // 1.  暴力法(会超时) O(n^2)
    func maxArea(_ height: [Int]) -> Int {
        var maxResult = 0
        for leftBarIndex in 0..<height.count {
            for rightBarIndex in leftBarIndex+1..<height.count {
                let area = (rightBarIndex - leftBarIndex) * min(height[leftBarIndex], height[rightBarIndex])
                maxResult = max(area, maxResult)
            }
        }
        return maxResult
    }
    // 2. 夹逼有序数组 O(n)
    func maxArea1(_ height: [Int]) -> Int {
        // 1. 设置前后指针向中心夹逼
        // 2. 优先夹逼短边，可有几率获得跟大的隔板
        var result = 0, leftBar = 0, rightBar = height.count - 1
        while leftBar < rightBar {
            let area = (rightBar - leftBar) * min(height[leftBar], height[rightBar])
            result = max(result, area)
            height[leftBar] < height[rightBar] ? (leftBar += 1) : (rightBar -= 1)
        }
        return result
    }
    func maxArea2(_ height: [Int]) -> Int {
        var result = 0, leftBar = 0, rightBar = height.count - 1
        while leftBar < rightBar {
            let area = (rightBar - leftBar) * min(height[leftBar], height[rightBar])
            result = max(result, area)
            if height[leftBar] < height[rightBar] {
                leftBar += 1
            } else {
                rightBar -= 1
            }
        }
        return result
    }
}
