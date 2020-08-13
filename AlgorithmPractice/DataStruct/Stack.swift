//
//  Stack.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/1.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

struct Stack<T> {
    private var array = [T]()
    // isEmpty
    public var isEmpty: Bool {
        return array.isEmpty
    }
    public var count: Int {
        return array.count
    }
    // push
    public mutating func push(_ element: T) {
        array.append(element)
    }
    // pop
    public mutating func pop() -> T? {
       return array.popLast()
    }
    // peek
    public var peek: T? {
        return array.last
    }
}

//extension Stack: Sequence {
//    public func makeIterator() -> some IteratorProtocol {
//        var cur = self
//        return AnyIterator {
//            return cur.pop()
//        }
//    }
//}

struct SequenceStackConstant {
    static let maxCount = 100
}

struct SequenceStack<T> {
    
    private var array = [T?](repeatElement(nil, count: SequenceStackConstant.maxCount))
    var top = -1
    
    public mutating func clear() {
        top = -1
    }
    
    public var isEmpty: Bool {
        return top == -1
    }
    
    public var peek: T? {
        guard !isEmpty else {
            return nil
        }
        return array[top]
    }
    
    public mutating func push(_ element: T) -> Bool {
        guard top != SequenceStackConstant.maxCount - 1 else {
            return false
        }
        top += 1
        array[top] = element
        return true
    }
    
    public mutating func pop() -> T? {
        guard !isEmpty else {
            return nil
        }
        let res = array[top]
        top -= 1
        return res
    }
    
    public func traverse() {
        var i = 0
        while i <= top {
            print(array[top] as Any)
            i += 1
        }
    }
}

struct LinkStack<T> {
    class StackNode {
        var val: T
        var next: StackNode?
        init(_ val: T) {
            self.val = val
        }
    }
    private var top: StackNode?
    private var count = 0
    
    public mutating func clear() {
        var cur = top
        while cur != nil {
            cur = cur?.next
        }
        count = 0
    }
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var length: Int {
        return count
    }
    
    public var peek: T? {
        return top?.val
    }
    
    public mutating func push(_ e: T) {
        let temp = StackNode(e)
        temp.next = top
        top = temp
        count += 1
    }
    
    public mutating func pop() -> T? {
        guard !isEmpty else {
            return nil
        }
        let temp = top
        top = top?.next
        temp?.next = nil
        count -= 1
        return temp?.val
    }
    
    public func traverse() {
        var cur = top
        while let data = cur?.val {
            print(data as Any)
            cur = cur?.next
        }
    }
}
