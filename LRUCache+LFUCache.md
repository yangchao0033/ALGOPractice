# LRUCache 和 LFUCache 实现

缓存中用的最多的两种结构

* LRUCache（Least Rencently Cache）至少最近缓存
* LFU（Least Frequently Cache）至少频率最高缓存

以下为相关的题目

## [146. LRU缓存机制](https://leetcode-cn.com/problems/lru-cache/)

__难度：中等__

运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。

获取数据 get(key) - 如果关键字 (key) 存在于缓存中，则获取关键字的值（总是正数），否则返回 -1。
写入数据 put(key, value) - 如果关键字已经存在，则变更其数据值；如果关键字不存在，则插入该组「关键字/值」。当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。

进阶:

你是否可以在 O(1) 时间复杂度内完成这两种操作？

> 技巧：此处要求 O(1) 时间复杂度，优先采用哈希表进行存储，达到查询复杂度为 O(1)，同时避免哈希冲突，采用开发寻址法，并存储双向链表队列，达到增删改复杂度为 O(1)

```swift
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
```



## [460. LFU缓存](https://leetcode-cn.com/problems/lfu-cache/)

__难度：困难__

请你为 最不经常使用（LFU）缓存算法设计并实现数据结构。它应该支持以下操作：get 和 put。

get(key) - 如果键存在于缓存中，则获取键的值（总是正数），否则返回 -1。
put(key, value) - 如果键已存在，则变更其值；如果键不存在，请插入键值对。当缓存达到其容量时，则应该在插入新项之前，使最不经常使用的项无效。在此问题中，当存在平局（即两个或更多个键具有相同使用频率）时，应该去除最久未使用的键。
「项的使用次数」就是自插入该项以来对其调用 get 和 put 函数的次数之和。使用次数会在对应项被移除后置为 0 。

> 技巧：此处要求时间复杂度为 O(1)，能使用的数据结构只有哈希表
>
> 技巧：为了避免哈希冲突，在频率哈希表中使用了开放寻址算法，通过存储双向链表队列来表示同一频率节点，保证增删复杂度也为 O(1)

```swift
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
        // 更新频率
        updateFreq(key, node)
        return node.val
    }
    
    func put(_ key: Int, _ value: Int) {
        guard capacity > 0 else { return }
        if let node = cache[key] {
            node.val = value
            // 更新频率
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
        minFreq = 1 // 重要：需要将最小频率更新为 1
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

```



