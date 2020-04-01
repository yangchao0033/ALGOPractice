//
//  BracketsIsValid.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/31.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

/// #20 有效括号
class BracketsIsValid: NSObject {
    func isValid(_ s: String) -> Bool {
//        let map: [Character: Character] = ["(": ")", "[": "]", "{": "}"]
//        var stack: Stack<Character> = Stack()
//        for char in s {
//            if map[char] != nil {
//                stack.push(char)
//            } else {
//                guard let top = stack.pop() else {
//                    return false
//                }
//                if map[top] != char {
//                    return false
//                }
//            }
//        }
//        return stack.isEmpty
        var stack: Stack<Character> = Stack()
        for char in s {
            switch char {
            case "(":
                stack.push(")")
            case "[":
                stack.push("]")
            case "{":
                stack.push("}")
            default:
                if char != stack.pop() {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}
