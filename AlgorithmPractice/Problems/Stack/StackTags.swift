//
//  StackTags.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/8/11.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class StackTags {
    /**
     *  20.有效的括号
     *  https://leetcode-cn.com/problems/valid-parentheses/
     */
    func isValid(_ s: String) -> Bool {
        let map: [Character: Character] = ["[": "]", "{": "}", "(": ")"]
        var stack = [Character]()
        for char in s {
            if map[char] != nil {
                stack.append(char)
            } else {
                guard let last = stack.popLast(), map[last] == char else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
    
    // swiftlint:disable identifier_name
    /**
     *  1047. 删除字符串中的所有相邻重复项
     *  https://leetcode-cn.com/problems/remove-all-adjacent-duplicates-in-string/
     */
    func removeDuplicates(_ S: String) -> String {
        var stack = [Character]()
        for char in S {
            if let last = stack.last, last == char {
                _ = stack.popLast()
            } else {
                stack.append(char)
            }
        }
        return String(stack)
    }
    // swiftlint:enable identifier_name
    
    /**
     *  682. 棒球比赛
     *  https://leetcode-cn.com/problems/baseball-game/
     */
    func calPoints(_ ops: [String]) -> Int {
        var stack = [Int]()
        for str in ops {
            switch str {
            case "+":
                let last0 = stack.popLast() ?? 0
                let last1 = stack.last ?? 0
                stack.append(last0)
                stack.append(last0 + last1)
            case "D":
                stack.append((stack.last ?? 0) * 2)
            case "C":
                _ = stack.popLast()
            default:
                stack.append(Int(str) ?? 0)
            }
        }
        return stack.reduce(0, +)
    }
    
    /**
     * 496. 下一个更大元素 I
     * https://leetcode-cn.com/problems/next-greater-element-i/
     */
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        // 1. 遍历 nums2, 并维护单调递减栈
        // 2. 使用hash 表记录第一个小的记录
        // 3. 遍历 num1，并通过 hash 表映射为结果
        var stack = [Int]()
        var map = [Int: Int]()
        for item in nums2 {
            while let last = stack.last, last <= item {
                map[stack.popLast()!] = item
            }
            stack.append(item)
        }
        return nums1.map { map[$0] ?? -1 }
    }
    
    /**
     *  503. 下一个更大元素 II
     *  https://leetcode-cn.com/problems/next-greater-element-ii/
     */
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        var stack = [Int]()
        let n = nums.count
        var res = [Int](repeating: 0, count: n)
        for i in (0..<n*2).reversed() {
            while let last = stack.last, last <= nums[i % n] {
                _ = stack.popLast()
            }
            res[i % n] = stack.last ?? -1
            stack.append(nums[i % n])
        }
        return res
    }
    
    // swiftlint:disable identifier_name
    /**
     *  739. 每日温度
     *  https://leetcode-cn.com/problems/daily-temperatures/
     */
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        // swiftlint:enable identifier_name
        // 使用元组
//        var stack = [(Int, Int)]()
//        let n = T.count
//        var res = [Int](repeating: 0, count: n)
//        for i in (0..<n).reversed() {
//            while let (_, value) = stack.last, value <= T[i] {
//                _ = stack.popLast()
//            }
//            let (index, _) = stack.last ?? (i, 0)
//            res[i] = index - i
//            stack.append((i, T[i]))
//        }
//        return res
        // 使用下标
        var stack = [Int]()
        let n = T.count
        var res = [Int](repeating: 0, count: n)
        for i in (0..<n).reversed() {
            while let last = stack.last, T[last] <= T[i] {
                _ = stack.popLast()
            }
            res[i] = (stack.last ?? i) - i
            stack.append(i)
        }
        return res
    }
    
}

/**
 *  232. 用栈实现队列
 *  https://leetcode-cn.com/problems/implement-queue-using-stacks/
 */
class MyQueue {
    var enterStack = [Int]()
    var deleteStack = [Int]()
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        enterStack.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        guard let x = deleteStack.popLast() else {
            guard !enterStack.isEmpty else {
                return -1
            }
            reverseHelper()
            return deleteStack.popLast()!
        }
        return x
    }
    
    /** Get the front element. */
    func peek() -> Int {
        guard let x = deleteStack.last else {
            guard !enterStack.isEmpty else {
                return -1
            }
            reverseHelper()
            return deleteStack.last!
        }
        return x
    }
    
    private func reverseHelper() {
        while let x = enterStack.popLast() {
            deleteStack.append(x)
        }
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return enterStack.isEmpty && deleteStack.isEmpty
    }
}

class MinStack {
    var stack = [Int]()
    var minStack = [Int]()
    init() {
    }
    
    func push(_ x: Int) {
        stack.append(x)
        guard let last = minStack.last, last < x else {
            minStack.append(x)
            return
        }
        minStack.append(last)
    }
    
    func pop() {
        _ = stack.popLast()
        _ = minStack.popLast()
    }
    
    func top() -> Int {
        return stack.last ?? Int.min
    }
    
    func min() -> Int {
        return minStack.last ?? Int.min
    }
}
