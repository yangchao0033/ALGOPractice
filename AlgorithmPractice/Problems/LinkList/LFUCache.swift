//
//  LFUCache.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/9/24.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class LFUCache {
    private let capacity: Int
    private var cache: [Int: LFUListNode]
    private var freqCache: [Int: LFULinkedList] = [:]
    private var minFreq = 1
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.cache = Dictionary(minimumCapacity: capacity)
    }
    
    func get(_ key: Int) -> Int {
        guard capacity > 0 else { return -1 } // capacity 异常
        guard let node = cache[key] else { return -1 } // cache miss 异常
        // 移除当前key所在频次最末尾节点，如果移空，则判断是否需要更新最小频率
        updateFreq(key, node)
        return node.val
    }
    
    func put(_ key: Int, _ value: Int) {
        guard capacity > 0 else { return }
        if let node = cache[key] {
            // freq + 1 （同 get）
            node.val = value
            updateFreq(key, node)
            return
        }
        if cache.count == capacity {
            guard let deleteNode = freqCache[minFreq]?.removeTail() else { return }
            cache[deleteNode.key] = nil
            if let oldList = freqCache[minFreq], oldList.isEmpty {
                freqCache[minFreq] = nil // 此处由于是新节点，频率为 1，所以不会引起最小 minFreq 的变化
            }
        }
        let list = freqCache[1, default: LFULinkedList()]
        let newNode = LFUListNode(key, value, 1)
        list.addNode2Head(newNode)
        freqCache[1] = list
        cache[key] = newNode
        minFreq = 1
    }
    
    private func updateFreq(_ key: Int, _ node: LFUListNode) {
        let val = node.val
        let freq = node.freq
        freqCache[freq]?.remove(node)
        if let oldList = freqCache[freq], oldList.isEmpty {
            freqCache[freq] = nil
            if minFreq == freq {
                minFreq += 1
            }
        }
        // 插入 freq + 1 中
        let list = freqCache[freq + 1, default: LFULinkedList()]
        let newNode = LFUListNode(key, val, freq + 1)
        list.addNode2Head(newNode)
        freqCache[freq + 1] = list
        cache[key] = newNode
    }
}

private class LFUListNode {
    var key: Int
    var val: Int
    var freq: Int
    var next: LFUListNode?
    weak var prev: LFUListNode?
    init(_ key: Int, _ val: Int, _ freq: Int) {
        self.key = key
        self.val = val
        self.freq = freq
    }
}

private class LFULinkedList {
    private let dummyHead = LFUListNode(-1, -1, -1)
    private let dummyTail = LFUListNode(-1, -1, -1)
    
    init() {
        dummyHead.next = dummyTail
        dummyTail.prev = dummyHead
    }
    
    public var isEmpty: Bool {
        return dummyHead.next === dummyTail
    }
    
    public func addNode2Head(_ node: LFUListNode) {
        node.prev = dummyHead
        node.next = dummyHead.next
        dummyHead.next?.prev = node
        dummyHead.next = node
    }
    
    public func removeTail() -> LFUListNode? {
        guard let tailNode = dummyTail.prev else { return nil }
        guard dummyHead !== tailNode else { return nil }
        remove(tailNode)
        return tailNode
    }
    
    public func remove(_ node: LFUListNode) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
        node.next = nil
        node.prev = nil
    }
}
