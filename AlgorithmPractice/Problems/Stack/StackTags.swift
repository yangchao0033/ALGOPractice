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
}

/**
 *  使用两个栈实现队列
 *  https://leetcode-cn.com/problems/yong-liang-ge-zhan-shi-xian-dui-lie-lcof/
 */
class CQueue {
    
    var appendStack = [Int]()
    var deleteStack = [Int]()
    
    init() {
        
    }
    
    func appendTail(_ value: Int) {
        appendStack.append(value)
    }
    
    func deleteHead() -> Int {
        
        guard let x = deleteStack.popLast() else {
            guard !appendStack.isEmpty else {
                return -1
            }
            while let last = appendStack.popLast() {
                deleteStack.append(last)
            }
            guard let deleteValue = deleteStack.popLast() else { return -1 }
            return deleteValue
        }
        return x
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
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if let last = minStack.last, last < x {
            minStack.append(last)
        } else {
            minStack.append(x)
        }
    }
    
    func pop() {
        _ = stack.popLast()
        _ = minStack.popLast()
    }
    
    func top() -> Int {
        stack.last ?? Int.min
    }
    
    func getMin() -> Int {
        minStack.last ?? Int.min
    }
}
