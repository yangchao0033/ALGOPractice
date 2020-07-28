//
//  SinglyLinkedList.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/7/23.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

public final class DoublyLinkedList<T> {
    
    /// 双向链表结点类定义
    public class DoublyLinkedListNode<T> {
        var value: T
        var next: DoublyLinkedListNode?
        weak var previous: DoublyLinkedListNode?
        
        public init(value: T) {
            self.value = value
        }
    }
    
    /// 使用别名提高可读性
    public typealias Node = DoublyLinkedListNode<T>
    
    /// head 结点仅内部可修改
    private(set) var head: Node?
    
    /// 通过计算属性返回末尾结点，时间 O(n)
    public var last: Node? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        return node
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    /// 使用计算属性得出结点数，时间 O(n)
    public var count: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    /// 默认初始化方法
    public init() {}
    
    /// 下标
    public subscript(index: Int) -> T {
        let tmpNode = node(at: index)
        return tmpNode.value
    }
    
    /// 通过索引找到对应的结点
    /// - Parameter index: 目标索引
    /// - Returns: 目标结点
    public func node(at index: Int) -> Node {
        // 相比直接返回 nil，这里使用断言更严谨，严格遵守苹果的索引下标查找失败处理，类似数组下标越界，视为开发者的失误，而不会隐藏这个问题
        assert(head != nil, "list is empty")
        assert(index >= 0, "index must greater or equal to 0")
        
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            
            assert(node != nil, "index is out of bounds.")
            return node!
        }
    }
    
    public func append(_ value: T) {
        let newNode = Node(value: value)
        append(newNode)
    }
    
    /// 末尾添加元素到链表中
    /// - Parameter node: 结点
    public func append(_ node: Node) {
        let newNode = node
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    /// 添加新的链表的拷贝到链表末尾
    /// - Parameter list: 要添加到末尾的链表
    public func append(_ list: DoublyLinkedList) {
        var nodeToCopy = list.head
        while let node = nodeToCopy {
            append(node.value)
            nodeToCopy = node.next
        }
    }
    
    public func insert(_ value: T, at index: Int) {
        let newNode = Node(value: value)
        insert(newNode, at: index)
    }
    
    /// 插入结点到链表的指定索引中
    /// - Parameters:
    ///   - newNode: 准备插入的节点
    ///   - index: 插入的位置索引
    public func insert(_ newNode: Node, at index: Int) {
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let prev = node(at: index - 1)
            let next = prev.next
            
            newNode.previous = prev
            newNode.next = next
            next?.previous = newNode
            prev.next = newNode
        }
    }
    
    /// 插入其他链表到本链表的指定位置
    /// - Parameters:
    ///   - list: 要插入的链表
    ///   - index: 要插入的位置索引
    public func insert(_ list: DoublyLinkedList, at index: Int) {
        guard !list.isEmpty else { return }
        
        if index == 0 {
            list.last?.next = head
            head = list.head
        } else {
            let prev = node(at: index - 1)
            let next = prev.next
            list.head?.previous = prev
            list.last?.next = next
            
            next?.previous = list.last
            prev.next = list.head
        }
    }
    
    /// 清空链表
    public func removeAll() {
        head = nil
    }
    
    /// 移除链表中指定的节点
    /// - Parameter node: 要移除的节点
    /// - Returns: 返回被移除节点的数据值
    @discardableResult public func remove(node: Node) -> T {
        let prev = node.previous
        let  next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        node.previous = nil
        node.next = nil
        return node.value
    }
    
    /// 移除链表末尾节点，注意如果链表为空将会 crash
    /// - Returns: 返回被移除的节点数据值
    @discardableResult public func removeLast() -> T {
        assert(!isEmpty)
        return remove(node: last!)
    }
    
    /// 移除指定索引的节点
    /// 注意：如果索引越界将会 crash（0...self.count）
    /// - Parameter index: 要移除的位置索引
    /// - Returns: 返回被移除节点数据值
    @discardableResult public func remove(at index: Int) -> T {
        let node = self.node(at: index)
        return remove(node: node)
    }
    
    public func printAll() {
        print(self)
//        var s = "["
//        var node = head
//        while let nd = node {
//            s += "\(nd.value)"
//            node = node?.next
//            if node != nil { s += ", " }
//        }
//        s += "]"
//        print(s)
    }
}

// MARK: - Extension to enable the standard conversion of a list to String
extension DoublyLinkedList: CustomStringConvertible {
    public var description: String {
        var s = "["
        var node = head
        while let nd = node {
            s += "\(nd.value)"
            node = nd.next
            if node != nil { s += ", " }
        }
        return s + "]"
    }
}

// MARK: - Extension to enable initialization from an Array
extension DoublyLinkedList {
    convenience init(array: [T]) {
        self.init()
        
        array.forEach { append($0) }
    }
}

// MARK: - An extension with an implementation of 'map' & 'filter' functions
extension DoublyLinkedList {
    public func map<U>(transform: (T) -> U) -> DoublyLinkedList<U> {
        let result = DoublyLinkedList<U>()
        var node = head
        while let nd = node {
            result.append(transform(nd.value))
            node = nd.next
        }
        return result
    }
    
    public func filter(predicate: (T) -> Bool) -> DoublyLinkedList<T> {
        let result = DoublyLinkedList<T>()
        var node = head
        while let nd = node {
            if predicate(nd.value) {
                result.append(nd.value)
            }
            node = nd.next
        }
        return result
    }
}

// MARK: - Extension to enable initialization from an Array Literal
extension DoublyLinkedList: ExpressibleByArrayLiteral {
    public convenience init(arrayLiteral elements: T...) {
        self.init()
        
        elements.forEach { append($0) }
    }
}

// MARK: - Collection
extension DoublyLinkedList: Collection {
    
    public typealias Index = LinkedListIndex<T>
    
    /// The position of the first element in a nonempty collection.
    ///
    /// If the collection is empty, `startIndex` is equal to `endIndex`.
    /// - Complexity: O(1)
    public var startIndex: Index {
        return LinkedListIndex<T>(node: head, tag: 0)
    }
    
    /// The collection's "past the end" position---that is, the position one
    /// greater than the last valid subscript argument.
    /// - Complexity: O(n), where n is the number of elements in the list. This can be improved by keeping a reference
    ///   to the last node in the collection.
    public var endIndex: Index {
        if let h = self.head {
            return LinkedListIndex<T>(node: h, tag: count)
        } else {
            return LinkedListIndex<T>(node: nil, tag: startIndex.tag)
        }
    }
    
    public subscript(position: Index) -> T {
        return position.node!.value
    }
    
    public func index(after idx: Index) -> Index {
        return LinkedListIndex<T>(node: idx.node?.next, tag: idx.tag + 1)
    }
}

// MARK: - Collection Index
/// Custom index type that contains a reference to the node at index 'tag'
public struct LinkedListIndex<T>: Comparable {
    fileprivate let node: DoublyLinkedList<T>.DoublyLinkedListNode<T>?
    fileprivate let tag: Int
    
    public static func == <T>(lhs: LinkedListIndex<T>, rhs: LinkedListIndex<T>) -> Bool {
        return (lhs.tag == rhs.tag)
    }
    
    public static func < <T>(lhs: LinkedListIndex<T>, rhs: LinkedListIndex<T>) -> Bool {
        return (lhs.tag < rhs.tag)
    }
}
