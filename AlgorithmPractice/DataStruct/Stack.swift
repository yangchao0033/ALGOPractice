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
