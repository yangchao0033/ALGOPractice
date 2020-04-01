//
//  Deque.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/1.
//  Copyright © 2020 superYang. All rights reserved.
//

public struct Deque<T> {
    // 内部私有容器
    private var array = [T]()
    // 数量
    public var count: Int {
        return array.count
    }
    // 判空
    public var isEmpty: Bool {
        return array.isEmpty
    }
    // 前进队列
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    // 后进队列
    public mutating func enqueueFront(_ element: T) {
        array.insert(element, at: 0)
    }
    // 前出队列
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        }
        return array.removeFirst()
    }
    // 后出队列
    public mutating func dequeueBack() -> T? {
        if isEmpty {
            return nil
        }
        return array.removeLast()
    }
    // 前看
    public var peekFront: T? {
        return array.first
    }
    // 后看
    public var peekBack: T? {
        return array.last
    }
}
