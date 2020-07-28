//
//  MyCircularDeque.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/6.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class MyCircularDeque: NSObject {
    // 1. 暴力
    //    private var maxSize = 0
    //    private var array = [Int]()
    //    /** Initialize your data structure here. Set the size of the deque to be k. */
    //    init(_ k: Int) {
    //        maxSize = k
    //    }
    //
    //    /** Adds an item at the front of Deque. Return true if the operation is successful. */
    //    func insertFront(_ value: Int) -> Bool {
    //        guard array.count < maxSize else { return false }
    //        array.insert(value, at: 0)
    //        return true
    //    }
    //
    //    /** Adds an item at the rear of Deque. Return true if the operation is successful. */
    //    func insertLast(_ value: Int) -> Bool {
    //        guard array.count < maxSize else { return false }
    //        array.append(value)
    //        return true
    //    }
    //
    //    /** Deletes an item from the front of Deque. Return true if the operation is successful. */
    //    func deleteFront() -> Bool {
    //        guard !array.isEmpty else { return false }
    //        array.removeFirst()
    //        return true
    //    }
    //
    //    /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
    //    func deleteLast() -> Bool {
    //        guard !array.isEmpty else { return false }
    //        array.removeLast()
    //        return true
    //    }
    //
    //    /** Get the front item from the deque. */
    //    func getFront() -> Int {
    //        guard let front = array.first else { return -1 }
    //        return front
    //    }
    //
    //    /** Get the last item from the deque. */
    //    func getRear() -> Int {
    //        guard let rear = array.last else { return -1 }
    //        return rear
    //    }
    //
    //    /** Checks whether the circular deque is empty or not. */
    //    func isEmpty() -> Bool {
    //        return array.isEmpty
    //    }
    //
    //    /** Checks whether the circular deque is full or not. */
    //    func isFull() -> Bool {
    //        return array.count == maxSize
    //    }
        // 2. 循环索引
        private var buffer: [Int]
        private var count: Int
        private var front: Int
        private var rear: Int
        private var k: Int
        init(_ k: Int) {
            buffer = [Int](repeating: 0, count: k)
            count = 0
            front = 0
            rear = 1
            self.k = k
        }
        
        func insertFront(_ value: Int) -> Bool {
            guard !isFull() else { return false } // 满了
            buffer[front] = value
            front = (front - 1 + k) % k
            count += 1
            return true
        }
        
        func insertLast(_ value: Int) -> Bool {
            guard !isFull() else { return false } // 满了
            buffer[rear] = value
            rear = (rear + 1) % k
            count += 1
            return true
        }
        
        func deleteFront() -> Bool {
            guard !isEmpty() else { return false }
            front = (front + 1) % k
            count -= 1
            return true
        }
        
        func deleteLast() -> Bool {
            guard !isEmpty() else { return false }
            rear = (rear - 1 + k) % k
            count -= 1
            return true
        }
        
        func getFront() -> Int {
            guard !isEmpty() else { return -1 }
            return buffer[(front + 1) % k]
        }
        
        func getRear() -> Int {
            guard !isEmpty() else { return -1 }
            return buffer[(rear - 1 + k) % k]
        }
        
        func isEmpty() -> Bool {
            return count == 0
        }
        
        func isFull() -> Bool {
            return count == k
        }
}
