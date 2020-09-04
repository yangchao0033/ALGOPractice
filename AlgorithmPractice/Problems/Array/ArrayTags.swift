//
//  FindMajorityElementLcci.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/7/29.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class ArrayTags: NSObject {
    /*
     https://leetcode-cn.com/problems/find-majority-element-lcci/
     数组中占比超过一半的元素称之为主要元素。给定一个整数数组，找到它的主要元素。若没有，返回-1
     */
    func majorityElement(_ nums: [Int]) -> Int {
        // 1. 字典暴力法 时间 O(n) 空间 O(n)
//        let n = nums.count
//        var dict = [Int: Int]()
//        var maxT: (main: Int? ,count: Int) = (main: nil, count: 0)
//        for i in 0..<n {
//            let index = nums[i]
//            if let onc = dict[index] {
//                dict[index] = onc + 1
//            } else {
//                dict[index] = 1
//            }
//            if let nc = dict[index], nc > maxT.count  {
//                maxT.main = index
//                maxT.count = nc
//            }
//        }
//        if let key = maxT.main {
//            return key
//        }
        // 2. 投票算法 时间 O(n) 空间 O(1)
        guard nums.count > 0 else {
            return -1
        }
        var key = nums[0]
        var count = 1
        for i in 1..<nums.count {
            if nums[i] == key {
                count += 1
            } else {
                count -= 1
            }
            if count == 0 { // 被对方打败了，让对方当候选人
                key = nums[i]
                count = 1
            }
        }
        var nc = 0
        for num in nums {
            if num == key {
                nc += 1
            }
            if nc > nums.count / 2 {
                return key
            }
        }
        
        return -1
    }
    
    /**
     *  118. 杨辉三角
     *  https://leetcode-cn.com/problems/pascals-triangle/
     */
    func generate(_ numRows: Int) -> [[Int]] {
        // 方法一：两层循环嵌套
//        var triangle = [[Int]]()
//        for rowIndex in 0..<numRows {
//            var row = [Int](repeating: 0, count: rowIndex + 1)
//            (row[0], row[row.count - 1]) = (1, 1)
//            for j in stride(from: 1, to: row.count - 1, by: 1) {
//                row[j] = triangle[rowIndex - 1][j - 1] + triangle[rowIndex - 1][j]
//            }
//            triangle.append(row)
//        }
//        return triangle
        // 方法二：错位相加
        guard numRows != 0 else {
            return []
        }
        var res = [[1]]
        while res.count < numRows {
            let row = zip(res.last! + [0], [0] + res.last!).map { $0.0 + $0.1 }
            res.append(row)
        }
        return res
    }
    
}
