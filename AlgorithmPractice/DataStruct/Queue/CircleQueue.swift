//
//  CircleQueue.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/8/19.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class CircleQueue {
    static let maxSize = 100
    var data = [Int](repeating: 0, count: maxSize)
    var front = 0
    var rear = 0
    
    init() {
    }
    
    func clear() {
        front = 0
        rear = 0
    }
    
    var maxSize: Int {
        return CircleQueue.maxSize
    }
    
    var isEmpty: Bool {
        return front == rear
    }
    
    var length: Int {
        return (front - rear + maxSize) % maxSize
    }
    
    var head: Int? {
        guard !isEmpty else {
            return nil
        }
        return data[front]
    }
    
    func travel() {
        var p = front
        while p != rear {
            p = (p + 1) % maxSize
        }
        print(p)
    }
    
    func put(_ e: Int) {
        guard !isFull else {
            return
        }
        data[rear] = e
        rear = (rear + 1) % maxSize
    }
    
    func poll() -> Int? {
        guard !isEmpty else {
            return nil
        }
        let q = data[front]
        front = (front + 1) % maxSize
        return q
    }
    
    private var isFull: Bool {
        return (rear + 1) % maxSize == front
    }
}
