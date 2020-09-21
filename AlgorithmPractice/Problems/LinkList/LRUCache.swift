//
//  LRUCache.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/9/21.
//  Copyright © 2020 superYang. All rights reserved.
//

import Foundation

class LRUCache {
    // swiftlint:disable nesting
    private class LRULinkedList {
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
        let head = LRUListNode()
        let tail = LRUListNode()
        
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
        
        private func removeNode(_ node: LRUListNode) {
            node.next?.previous = node.previous
            node.previous?.next = node.next
        }
        
        func moveNodeToHead(_ node: LRUListNode) {
            removeNode(node)
            addNodeToHead(node)
        }
        
        func removeTailNode() -> LRUListNode? {
            let node = tail.previous!
            guard node !== head else { return nil }
            removeNode(node)
            return node
        }
    }
    
    private let capacity: Int
    private var size: Int = 0
    private var cache: [Int: LRULinkedList.LRUListNode] = [:]
    private var priority: LRULinkedList = LRULinkedList()
    
    init(_ capacity: Int) {
        self.capacity = capacity
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
        } else {
            let newNode = LRULinkedList.LRUListNode(key, value)
            cache[key] = newNode
            size += 1
            priority.addNodeToHead(newNode)
            if size > capacity {
                guard let tailNode = priority.removeTailNode() else { return }
                size -= 1
                cache.removeValue(forKey: tailNode.key)
            }
        }
    }
    
}
