//
//  ArrayBinaryTree.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/9/4.
//  Copyright © 2020 superYang. All rights reserved.
//

import Foundation

struct ABTConstant {
    static let maxTreeSize = 100
    static let elementNil = Int.max
}

struct ArrayBinaryTree {
    
    struct ABPosition {
        var level = 0 // 层序
        var order = 0 // 本层的序号
    }
    
    var array = [Int](repeatElement(ABTConstant.elementNil, count: ABTConstant.maxTreeSize))
    
    var isEmpty: Bool {
        return array[0] == 0
    }
    
    var depth: Int {
        var j = -1
        var last = 0
        // 找到最后一个节点的索引
        for i in (0..<ABTConstant.maxTreeSize).reversed() where array[i] != ABTConstant.elementNil {
            last = i
            break
        }
        repeat {
            j += 1
        } while powBinaryInt(j) <= last
        return j
    }
    
    func value(of e: ABPosition) -> Int {
        return array[powBinaryInt(e.level - 1) + e.order - 2]
    }
    
    var rootVal: Int? {
        guard isEmpty else {
            return nil
        }
        return array[0]
    }
    
    mutating func assign(to p: ABPosition, value: Int) -> Bool {
        let index = powBinaryInt(p.level - 1) + p.order - 2
        // 双亲节点为空
        if value != ABTConstant.elementNil && array[(index + 1) / 2 - 1] == ABTConstant.elementNil {
            return false
        }
        // 双亲节点赋空值时还存在叶子节点
        if value == ABTConstant.elementNil &&
            (array[index * 2 + 1] != ABTConstant.elementNil || array[index * 2 + 2] != ABTConstant.elementNil) {
            return false
        }
        array[index] = value
        return true
    }
    
    func parent(of c: Int) -> Int {
        guard !isEmpty else {
            return ABTConstant.elementNil
        }
        for i in 1..<ABTConstant.maxTreeSize where array[i] == c {
            return array[(i + 1) / 2 - 1]
        }
        return ABTConstant.elementNil
    }
    
    func leftChild(of p: Int) -> Int {
        guard !isEmpty else { return ABTConstant.elementNil }
        for i in 0..<ABTConstant.maxTreeSize - 1 where array[i] == p {
            return array[i * 2 + 1]
        }
        return ABTConstant.elementNil
    }
    
    func rightChild(of p: Int) -> Int {
        guard !isEmpty else { return ABTConstant.elementNil }
        for i in 0..<ABTConstant.maxTreeSize - 1 where array[i] == p {
            return array[i * 2 + 2]
        }
        return ABTConstant.elementNil
    }
    
    func leftBrother(of e: Int) -> Int {
        guard !isEmpty else { return ABTConstant.elementNil }
        for i in 1..<ABTConstant.maxTreeSize - 1 where array[i] == e && i % 2 == 0 {
            return array[i - 1]
        }
        return ABTConstant.elementNil
    }
    
    func rightBrother(of e: Int) -> Int {
        guard !isEmpty else { return ABTConstant.elementNil }
        for i in 1..<ABTConstant.maxTreeSize - 1 where array[i] == e && i % 2 != 0 {
            return array[i + 1]
        }
        return ABTConstant.elementNil
    }
    
    private func powBinaryInt(_ x: Int) -> Int {
        return Int(pow(2, Double(x)))
    }

    func levelOrderTraverse() {
        var last = ABTConstant.maxTreeSize
        while array[last] == ABTConstant.elementNil {
            last -= 1
        }
        for i in 0...last where array[i] != ABTConstant.elementNil {
            visit(array[i])
        }
    }
    
    func preOrderTraverse() {
        guard !isEmpty else {
            return
        }
        
        func preTraverseHelper(_ e: Int) {
            visit(array[e])
            if array[2 * e + 1] != ABTConstant.elementNil {
                preTraverseHelper(2 * e + 1)
            }
            if array[2 * e + 2] != ABTConstant.elementNil {
                preTraverseHelper(2 * e + 2)
            }
        }
        preTraverseHelper(0)
    }
    
    func inTraverse() {
        guard !isEmpty else {
            return
        }
        func inTraverseHelper(_ e: Int) {
            if array[2 * e + 1] != ABTConstant.elementNil {
                inTraverseHelper(2 * e + 1)
            }
            visit(array[e])
            if array[2 * e + 2] != ABTConstant.elementNil {
                inTraverseHelper(2 * e + 2)
            }
        }
        inTraverseHelper(0)
    }
    
    func postTraverse() {
        guard !isEmpty else {
            return
        }
        func postTraverseHelper(_ e: Int) {
            if array[2 * e + 1] != ABTConstant.elementNil {
                postTraverseHelper(2 * e + 1)
            }
            if array[2 * e + 2] != ABTConstant.elementNil {
                postTraverseHelper(2 * e + 2)
            }
            visit(array[e])
        }
    }
    
    func visit(_ c: Int) {
        print(c)
    }
}
