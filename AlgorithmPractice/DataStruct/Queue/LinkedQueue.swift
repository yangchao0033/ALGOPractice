//
//  LinkedQueue.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/8/19.
//  Copyright © 2020 superYang. All rights reserved.
//

import Foundation

class LinkedQueue {
    class LinkedQueueNode {
        var data: Int
        var next: LinkedQueueNode?
        init(_ val: Int) {
            data = val
        }
    }
    
    var front: LinkedQueueNode?
    var rear: LinkedQueueNode?
    
    init() {
        front = LinkedQueueNode(-1)
        rear = front
    }
    
    func clear() {
        rear = front
        front?.next = nil
    }
    
    var isEmpty: Bool {
        return rear === front
    }
    
    var length: Int {
        var p = front
        var i = 0
        while p !== rear {
            p = p?.next
            i += 1
        }
        return i
    }
    
    func enquene(_ val: Int) {
        let node = LinkedQueueNode(val)
        rear?.next = node
        rear = rear?.next
    }
    
    func dequeue() -> Int? {
        guard !isEmpty else {
            return nil
        }
        let p = front?.next
        front?.next = p?.next
        if rear === p {
            rear = front
        }
        p?.next = nil
        return p?.data
    }
    
    var head: LinkedQueueNode? {
        guard !isEmpty else {
            return nil
        }
        return front?.next
    }
    
    func traverse() {
        var p = front?.next
        while let node = p {
            print(node.data)
            p = p?.next
        }
    }
}
