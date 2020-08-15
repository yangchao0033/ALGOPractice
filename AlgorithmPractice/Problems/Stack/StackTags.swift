//
//  StackTags.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/8/11.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

// swiftlint:disable file_length type_body_length
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
     *  921. 使括号有效的最少添加
     *  https://leetcode-cn.com/problems/minimum-add-to-make-parentheses-valid/
     */
    func minAddToMakeValid(_ S: String) -> Int {
        // swiftlint:enable identifier_name
        // 栈 O(n) O(n)
//        var errCount = 0
//        var stack = [Character]()
//        for c in S {
//            if c == "(" {
//                stack.append(c)
//            } else {
//                guard let x = stack.popLast(), x == "(" else {
//                    errCount += 1
//                    continue
//                }
//            }
//        }
//        return errCount + stack.count
        // 计算 O(n) O(1)
        var hc = 0
        var tc = 0
        for c in S {
            if c == "(" {
                hc += 1
            } else {
                if hc > 0 {
                    hc -= 1
                } else {
                    tc += 1
                }
            }
        }
        return hc + tc
        // 不停替换 "()" 就不实现了，有点low
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
        // 1. 遍历 nums2, 并维护单调递减栈(正序暂时不研究了)
        // 2. 使用hash 表记录第一个小的记录
        // 3. 遍历 num1，并通过 hash 表映射为结果
        //        var stack = [Int]()
        //        var map = [Int: Int]()
        //        for item in nums2 {
        //            while let last = stack.last, last <= item {
        //                map[stack.popLast()!] = item
        //            }
        //            stack.append(item)
        //        }
        //        return nums1.map { map[$0] ?? -1 }
        // 方法二： 逆序
        var stack = [Int]()
        var map = [Int: Int]()
        for item in nums2.reversed() {
            while let last = stack.last, last <= item {
                _ = stack.popLast()
            }
            map[item] = stack.last ?? -1
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
    
    /**
     *  1441. 用栈操作构建数组
     *  https://leetcode-cn.com/problems/build-an-array-with-stack-operations/
     */
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        var res = [String]()
        var p = 0
        for item in 1...target[target.count - 1] {
            res.append("Push")
            if target[p] != item {
                res.append("Pop")
            } else {
                p += 1
            }
        }
        return res
    }
    
    // swiftlint:disable identifier_name
    /**
     *  844. 比较含退格的字符串
     *  https://leetcode-cn.com/problems/backspace-string-compare/
     */
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        // swiftlint:enable identifier_name
        // 方法一：操作两个栈
        var stackS = ""
        var stackT = ""
        for char in S {
            if char == "#" {
                _ = stackS.popLast()
            } else {
                stackS.append(char)
            }
        }
        for char in T {
            if char == "#" {
                _ = stackT.popLast()
            } else {
                stackT.append(char)
            }
        }
        return stackS == stackT
    }
    
    // swiftlint:disable identifier_name
    /**
     *  1021. 删除最外层的括号
     *  https://leetcode-cn.com/problems/remove-outermost-parentheses/
     */
    func removeOuterParentheses(_ S: String) -> String {
        // swiftlint:enable identifier_name
        // 栈 O(n) O(n)
        var stack = [Character]()
        var res = [Character]()
        for char in S {
            if char == "(" {
                stack.append(char)
                if stack.count > 1 {
                    res.append(char)
                }
            } else {
                _ = stack.popLast()
                if !stack.isEmpty {
                    res.append(char)
                }
            }
        }
        return String(res)
    }
    /**
     *  1544. 整理字符串
     *  https://leetcode-cn.com/problems/make-the-string-great/
     */
    func makeGood(_ s: String) -> String {
        var stack = [Character]()
        for char in s {
            if let last = stack.last, last != char, last.lowercased() == char.lowercased() {
                _ = stack.popLast()
            } else {
                stack.append(char)
            }
        }
        return String(stack)
    }
    
    /**
     *  636. 函数的独占时间
     *  https://leetcode-cn.com/problems/exclusive-time-of-functions/
     */
    func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
        var res = [Int](repeating: 0, count: n)
        var stack = [(Int, Int)]()
        for log in logs {
            let piece = log.components(separatedBy: ":")
            let ID = Int(piece[0])!
            let flag = piece[1]
            let timeStamp = Int(piece[2])!
            let tuple = (ID, timeStamp)
            
            if flag == "start" {
                stack.append(tuple)
            } else {
                if let (_, topTs) = stack.popLast() {
                    let duration = timeStamp - topTs + 1
                    res[ID] += duration
                    if let (topID, _) = stack.last {
                        res[topID] -= duration
                    }
                }
            }
        }
        return res
    }
    
    /**
     *  456. 132模式
     *  https://leetcode-cn.com/problems/132-pattern/
     */
    func find132pattern(_ nums: [Int]) -> Bool {
        var ak = Int.min
        var stack = [Int]()
        for num in nums.reversed() {
            if ak > num { return true }
            while let top = stack.last, top < num {
                ak = stack.popLast()!
            }
            stack.append(num)
        }
        return false
    }
    
    // swiftlint:disable identifier_name
    /**
     * 880. 索引处的解码字符串
     * https://leetcode-cn.com/problems/decoded-string-at-index/
     */
    func decodeAtIndex(_ S: String, _ K: Int) -> String {
        // node: 该题目容易内存溢出，不要尝试完全解码
        // 1. 正向遍历算出解码后的长度
        var size = 0
        for c in S {
            if c.isASCII && c.isWholeNumber {
                size *= c.wholeNumberValue!
            } else {
                size += 1
            }
        }
        var K = K
        // 2. 逆序遍历解码内容
        for c in S.reversed() {
            // 更新 K 的位置，避免不必要的循环
            K %= size
            // 3. 通过解码，找到 K 的字母位置
            if K == 0 && c.isLetter {
                return String(c)
            }
            if c.isASCII && c.isWholeNumber {
                size /= c.wholeNumberValue!
            } else {
                size -= 1
            }
        }
        return ""
    }
    // swiftlint:enable identifier_name
    
    /**
     *  394. 字符串解码
     *  https://leetcode-cn.com/problems/decode-string/
     */
    func decodeString(_ s: String) -> String {
        var stack = [(Int, String)]()
        var res = ""
        var muti = 0
        for c in s {
            switch c {
            case "[":
                stack.append((muti, res))
                muti = 0
                res = ""
            case "]" :
                if let (curMutil, lastRes) = stack.popLast() {
                    res = lastRes + String(repeating: res, count: curMutil)
                }
            case let x where c.isWholeNumber:
                muti = muti * 10 + x.wholeNumberValue!
            default:
                res.append(c)
            }
        }
        return res
    }
    // swiftlint:disable identifier_name
    /**
     *  856. 括号的分数
     *  https://leetcode-cn.com/problems/score-of-parentheses/
     */
    func scoreOfParentheses(_ S: String) -> Int {
        // swiftlint:enable identifier_name
        // 栈 O(n) O(n)
//        var stack = [Int]()
//        let flag = -1
//        for c in S {
//            if c == "(" {
//                stack.append(flag)
//            } else {
//                if let top = stack.last, top == flag {
//                    _ = stack.popLast()
//                    stack.append(1)
//                } else {
//                    var temp = 0
//                    while let a = stack.popLast(), a != flag {
//                        temp += a
//                    }
//                    stack.append(temp * 2)
//                }
//            }
//        }
//        return stack.reduce(0, +)
        // 算分 O(n) O(1)
        var res = 0, bal = 0
        let chars = Array(S)
        for i in 0..<chars.count {
            if chars[i] == "(" {
                bal += 1
            } else {
                bal -= 1
                if chars[i - 1] == "(" {
                    res += 1 << bal
                }
            }
        }
        return res
    }
    
    // swiftlint:disable for_where
    /**
     *  735.行星碰撞
     *  https://leetcode-cn.com/problems/asteroid-collision/
     */
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        // lable 控制（推荐但不好写出来）
        var stack = [Int]()
        for star in asteroids {
            innerLable: if true {
                while let top = stack.last, star < 0, 0 < top {
                    if top < -star { // 销毁栈顶行星, 并进行下一次判断
                        _ = stack.popLast()
                        continue
                    } else if top == -star { // 销毁新加入的行星，同时不入栈
                        _ = stack.popLast()
                    }
                    // 直接跳出，不入栈
                    break innerLable
                }
                // 当有新行星不会相撞时入栈，比如同向
                stack.append(star)
            }
        }
        return stack
        // func 版本
//        var stack = [Int]()
//        for star in asteroids {
//            controlHelper(&stack, star)
//        }
//        return stack
    }
    // swiftlint:enable for_where
    
    func controlHelper(_ stack: inout [Int], _ star: Int) {
        while let top = stack.last, star < 0, 0 < top {
            if top < -star { // 销毁栈顶行星, 并进行下一次判断
                _ = stack.popLast()
                continue
            } else if top == -star { // 销毁新加入的行星，同时不入栈
                _ = stack.popLast()
            }
            // 直接跳出，不入栈
            return
        }
        // 当有新行星不会相撞时入栈，比如同向
        stack.append(star)
    }
    
    /**
     *  71. 简化路径
     *  https://leetcode-cn.com/problems/simplify-path/
     */
    func simplifyPath(_ path: String) -> String {
        var stack = [Substring]()
        let paths = path.split(separator: "/")
        for item in paths {
            if item == ".." {
                _ = stack.popLast()
            } else if !item.isEmpty && item != "." {
                stack.append(item)
            }
        }
        return "/" + stack.joined(separator: "/")
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

class MyStack {
    
    // 方法一：双队列
    //    var enterQueue = [Int]()
    //    var deleteQueue = [Int]()
    //    var mTop: Int?
    //    /** Initialize your data structure here. */
    //    init() {
    //
    //    }
    //
    //    /** Push element x onto stack. */
    //    func push(_ x: Int) {
    //        enterQueue.append(x)
    //        mTop = x
    //    }
    //
    //    /** Removes the element on top of the stack and returns that element. */
    //    func pop() -> Int {
    //        while enterQueue.count > 1 {
    //            mTop = enterQueue.removeFirst()
    //            deleteQueue.append(mTop!)
    //        }
    //        let res = enterQueue.removeFirst()
    //        (enterQueue, deleteQueue) = (deleteQueue, enterQueue)
    //        return res
    //    }
    //
    //    /** Get the top element. */
    //    func top() -> Int {
    //        guard let top = mTop else {
    //            return -1
    //        }
    //        return top
    //    }
    //
    //    /** Returns whether the stack is empty. */
    //    func empty() -> Bool {
    //        return enterQueue.isEmpty
    //    }
    // 方法二：单队列
    var queue = [Int]()
    var mTop = -1
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        queue.append(x)
        mTop = x
        var size = queue.count
        while size > 1 {
            queue.append(queue.removeFirst())
            size -= 1
        }
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        return queue.removeFirst()
    }
    
    /** Get the top element. */
    func top() -> Int {
        return queue.first!
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return queue.isEmpty
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
// swiftlint:enable file_length type_body_length
