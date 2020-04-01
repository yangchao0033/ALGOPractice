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
        array.isEmpty
    }
    // push
    public mutating func push(_ element: T) {
        array.append(element)
    }
    // pop
    public mutating func pop() -> T? {
        array.popLast()
    }
    // peek
    public var peek: T? {
        array.last
    }
}
