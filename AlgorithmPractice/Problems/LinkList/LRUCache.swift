//
//  LRUCache.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/9/21.
//  Copyright © 2020 superYang. All rights reserved.
//

import Foundation

class LRUCache {
    private let capacity: Int
    private var size: Int = 0
    private var cache: [Int: LRUListNode]
    private var priority: LRULinkedList = LRULinkedList()
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.cache = Dictionary(minimumCapacity: capacity)
    }
    
    func get(_ key: Int) -> Int {
        guard let node = cache[key] else { return -1 }
        priority.moveNodeToHead(node)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = cache[key] {
            node.value = value
            priority.moveNodeToHead(node)
            return
        }
        if cache.count == capacity {
            guard let tailNode = priority.removeTailNode() else { return }
            cache.removeValue(forKey: tailNode.key)
        }
        let newNode = LRUListNode(key, value)
        cache[key] = newNode
        priority.addNodeToHead(newNode)
    }
}

private class LRULinkedList {
    
    private let head = LRUListNode()
    private let tail = LRUListNode()
    
    init() {
        self.head.next = self.tail
        self.tail.previous = self.head
    }
    
    func addNodeToHead(_ node: LRUListNode) {
        node.next = head.next
        node.previous = head
        head.next?.previous = node
        head.next = node
    }
    
    func moveNodeToHead(_ node: LRUListNode) {
        removeNode(node)
        addNodeToHead(node)
    }
    
    func removeTailNode() -> LRUListNode? {
        guard let node = tail.previous else { return nil }
        removeNode(node)
        return node
    }
    
    private func removeNode(_ node: LRUListNode) {
        guard head.next !== tail else { return } // 判空
        node.next?.previous = node.previous
        node.previous?.next = node.next
    }
}

class LRUListNode {
    var key: Int = 0
    var value: Int = 0
    var next: LRUListNode?
    weak var previous: LRUListNode?
    
    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
    }
    init() {}
}
