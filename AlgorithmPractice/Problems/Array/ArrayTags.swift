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
    // 合并有序数组
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        // 双指针
        var l1 = m - 1
        var l2 = n - 1
        var l = m + n - 1
        
        while l1 >= 0 && l2 >= 0 {
            if nums1[l1] > nums2[l2] {
                nums1[l] = nums1[l1]
                l1 -= 1
            } else {
                nums1[l] = nums2[l2]
                l2 -= 1
            }
            l -= 1
        }
        if l2 >= 0 {
            nums1.replaceSubrange(0..<l2 + 1, with: nums2[0..<l2 + 1])
            /*
            // 这里可以替换为 while 循环
            while l2 >= 0 {
                nums1[l2] = nums2[l2]
                l2 -= 1
            }
             */
        }
    }
    
    /*
     二分查找数组中与目标元素相等的数
     */
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            let p = nums[mid]
            if p == target {
                return mid
            } else if p > target {
                right = mid - 1
            } else if p < target {
                left = mid + 1
            }
        }
        return -1
    }
    
    // 找到两个排序数组的中位数
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
//        var nums1 = nums1
//        func helper() {
//            // 合并两个有序数组
//            var l1 = nums1.count - 1
//            var l2 = nums2.count - 1
//            var l = nums1.count + nums2.count - 1
//            nums1.append(contentsOf: [Int](repeating: 0, count: nums2.count))
//            while l1 >= 0 && l2 >= 0 {
//                if nums1[l1] > nums2[l2] {
//                    nums1[l] = nums1[l1]
//                    l1 -= 1
//                } else {
//                    nums1[l] = nums2[l2]
//                    l2 -= 1
//                }
//                l -= 1
//            }
//            if l2 >= 0 {
//                while l2 >= 0 {
//                    nums1[l2] = nums2[l2]
//                    l2 -= 1
//                }
//            }
//        }
//        helper()
//        if nums1.isEmpty {
//            return -1
//        }
//        if nums1.count % 2 == 1 {
//            return Double(nums1[nums1.count / 2])
//        } else {
//            return Double(nums1[nums1.count / 2 - 1] + nums1[nums1.count / 2]) / 2
//        }
        let count1 = nums1.count, count2 = nums2.count
        let totalCount = count1 + count2
        if totalCount % 2 == 1 {
            let mid = totalCount / 2
            return Double(getKthElement(nums1, nums2, mid + 1))
        } else {
            let mid1 = totalCount / 2 - 1, mid2 = totalCount / 2
            return Double(getKthElement(nums1, nums2, mid1 + 1) + getKthElement(nums1, nums2, mid2 + 1)) / 2
        }
    }
    // 获取两个数组中第 K 小的数
    func getKthElement(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
        var k = k
        let count1 = nums1.count, count2 = nums2.count
        var index1 = 0, index2 = 0
        
        while true {
            if index1 == count1 {
                return nums2[index2 + k - 1]
            }
            if index2 == count2 {
                return nums1[index1 + k - 1]
            }
            if k == 1 {
                return min(nums1[index1], nums2[index2])
            }
            let half = k / 2
            let newIndex1 = min(index1 + half, count1) - 1
            let newIndex2 = min(index2 + half, count2) - 1
            let pivot1 = nums1[newIndex1], pivot2 = nums2[newIndex2]
            if pivot1 <= pivot2 {
                k -= newIndex1 - index1 + 1
                index1 = newIndex1 + 1
            } else {
                k -= newIndex2 - index2 + 1
                index2 = newIndex2 + 1
            }
        }
    }
}
