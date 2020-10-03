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
    
    func search1(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else { return -1 }
        var lb = 0, rb = nums.count - 1
        while lb <= rb {
            let mid = lb + (rb - lb) >> 1
            if nums[mid] == target {
                return mid
            }
            if nums[mid] >= nums[lb] {
                // mid 在左边
                if target >= nums[lb] && target < nums[mid] { // 在有序区间
                    rb = mid - 1
                } else {
                    lb = mid + 1
                }
            } else {
                // mid 在右边
                if target > nums[mid] && target <= nums[rb] { // 在有序区间
                    lb = mid + 1
                } else {
                    rb = mid - 1
                }
            }
        }
        return -1
    }
    
    // 字符串相乘 https://leetcode-cn.com/problems/multiply-strings/
    func multiply(_ num1: String, _ num2: String) -> String {
        guard num1 != "0" && num2 != "0" else { return "0" }
        let m = num1.count, n = num2.count
        var res = [Int](repeating: 0, count: m + n)
        for (i, c1) in num1.enumerated().reversed() {
            let n1 = c1.wholeNumberValue!
            for (j, c2) in num2.enumerated().reversed() {
                let n2 = c2.wholeNumberValue!
                let sum = res[i + j + 1] + n1 * n2
                res[i + j + 1] = sum % 10
                res[i + j] += sum / 10
            }
        }
        var s = ""
        for i in 0..<res.count {
            if i == 0 && res[i] == 0 {
                continue
            }
            s.append(String(res[i]))
        }
        return s
    }
    // 字符串相加 https://leetcode-cn.com/problems/add-strings/
    func addStrings(_ num1: String, _ num2: String) -> String {
        let chars1 = [Character](num1), chars2 = [Character](num2)
        var i = chars1.count - 1, j = chars2.count - 1, carry = 0
        let zeroAsc = ("0" as Character).asciiValue!
        var res = ""
        while i >= 0 || j >= 0 || carry > 0 {
            let n1 = i >= 0 ? Int(chars1[i].asciiValue! - zeroAsc) : 0
            let n2 = j >= 0 ? Int(chars2[j].asciiValue! - zeroAsc) : 0
            let sum = n1 + n2 + carry
            res.append(String(sum % 10))
            carry = sum / 10
            i -= 1
            j -= 1
        }
        return String(res.reversed())
    }
    
    // 反转单词
    func reverseWords(_ s: String) -> String {
        var chars = [Character](s)
        var i = 0
        while i < chars.count {
            let start = i
            while i < chars.count && chars[i] != " " {
                i += 1
            }
            var left = start, right = i - 1
            while left < right {
                chars.swapAt(left, right)
                left += 1
                right -= 1
            }
            while i < chars.count && chars[i] == " " {
                i += 1
            }
        }
        return String(chars)
    }
    
    // 最大子序和
    func maxSubArray(_ nums: [Int]) -> Int {
        // 动态规划.
        // 计算前面的和与当前的位置的和，如果前面的和大于0则相加，否则，直接覆盖，并一边计算最大结果
        guard nums.count > 0 else { return 0 }
        var sum = 0, maxAns = nums[0]
        for n in nums {
            if sum > 0 {
                sum += n
            } else {
                sum = n
            }
            maxAns = max(maxAns, sum)
        }
        return maxAns
    }
    
    // 爬楼梯
    func climbStairs(_ n: Int) -> Int {
        guard n > 2 else { return n }
        var first = 1
        var second = 2
        for _ in 3...n {
            (first, second) = (second, first + second)
        }
        return second
    }
    
    // 股票最大利益
    func maxProfit(_ prices: [Int]) -> Int {
        var minProfit = Int.max
        var maxProfit = 0
        for p in prices {
            if p < minProfit {
                minProfit = p
            } else {
                maxProfit = max(maxProfit, p - minProfit)
            }
        }
        return maxProfit
    }
    
    func maxProfit2(_ prices: [Int]) -> Int {
        var maxProfit = 0
        for i in 1..<prices.count {
            if prices[i] > prices[i - 1] {
                maxProfit += prices[i] - prices[i - 1]
            }
        }
        return maxProfit
    }
    
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var res = [Int]()
        guard !matrix.isEmpty && !matrix[0].isEmpty else { return res }
        let rows = matrix.count
        let cols = matrix[0].count
        var left = 0, right = cols - 1, top = 0, bottom = rows - 1
        while left <= right && top <= bottom {
            var col = left
            while col <= right {
                res.append(matrix[top][col])
                col += 1
            }
            var row = top + 1
            while row <= bottom {
                res.append(matrix[row][right])
                row += 1
            }
            if left < right && top < bottom {
                col = right - 1
                while col > left {
                    res.append(matrix[bottom][col])
                    col -= 1
                }
                row = bottom
                while row > top {
                    res.append(matrix[row][left])
                    row -= 1
                }
            }
            top += 1
            bottom -= 1
            left += 1
            right -= 1
        }
        return res
    }
    
    func minNumberDisappeared(_ arr: [Int]) -> Int {
        var arr = arr
        for i in 0..<arr.count {
            let temp = arr[i]
            if arr[i] > 0 && temp <= arr.count {
                arr[i] = arr[temp - 1]
                arr[temp - 1] = temp
            }
        }
        for i in 0..<arr.count {
            if arr[i] != i + 1 {
                return i + 1
            }
        }
        return arr.count + 1
    }
    
    func merge(_ intervals: [Interval]) -> [Interval] {
        var intervals = intervals
        var res = [Interval]()
        guard !intervals.isEmpty else { return res }
        intervals.sort { $0.start < $1.start }
        res.append(intervals[0])
        for i in 0..<intervals.count {
            if intervals[i].start <= res.last!.end {
                res.last!.end = max(intervals[i].end, res.last!.end)
            } else {
                res.append(intervals[i])
            }
        }
        return res
    }
    
}

class Interval {
       var start: Int
       var end: Int
       init() {
           start = 0
           end = 0
       }
       init(_ s: Int, _ e: Int) {
           start = s
           end = e
       }
       
   }
