//
//  singlyLinkedCircularList.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/7/24.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

/// 单向循环链表
public final class SinglyLinkedCircularList<T> {
    public class SinglyLinkedCircularListNode<T> {
        var value: T
        var next: SinglyLinkedCircularListNode?
        
        init(value: T) {
            self.value = value
        }
    }
    
    public typealias CLNode = SinglyLinkedCircularListNode<T>
    
    private(set) var head: CLNode?
    
    init() {}
    
    var last: CLNode? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            if next === head {
                break
            }
            node = next
        }
        return node
    }
    
    var isEmpty: Bool { head == nil }
    
    var count: Int {
        guard var node = head else {
            return 0
        }
        var count = 1
        while let next = node.next {
            if next === head {
                break
            }
            node = next
            count += 1
        }
        return count
    }
    
    public subscript(index: Int) -> T {
        let nd = node(at: index)
        return nd.value
    }
    
    public func node(at index: Int) -> CLNode {
        assert(head != nil, "List is empty")
        assert(index >= 0, "index must be greater or equal to 0")
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node === head {
                    break
                }
            }
            
            assert(node !== head, "index is out of bounds")
            
            return node!
        }
    }
    
    public func append(_ value: T) {
        let node = CLNode(value: value)
        append(node)
    }
    
    public func append(_ node: CLNode) {
        let newNode = node
        if let lastNode = last {
            newNode.next = lastNode.next
            lastNode.next = newNode
        } else {
            head = newNode
            newNode.next = head
        }
    }
    
    public func insert(_ value: T, at index: Int) {
        let node = CLNode(value: value)
        insert(node, at: index)
    }
    
    func insert(_ node: CLNode, at index: Int) {
        if index == 0 {
            if let lastNode = last {
                node.next = head
                lastNode.next = node
                head = node
            } else {
                head = node
                node.next = head
            }
        } else {
            let prev = self.node(at: index - 1)
            let next = prev.next
            node.next = next
            prev.next = node
        }
    }
    
    public func printAll() {
        var s = "["
        
        guard var node = head else {
            s += "]"
            print(s)
            return
        }
        
        while let next = node.next {
            s += "\(node.value)"
            node = next
            if node !== head {
                s += ", "
            } else {
                break
            }
        }
        s += "]"
        print(s)
    }
    
    func removeAll() {
        head = nil
    }
    
    @discardableResult public func remove(at index: Int) -> T {
        let nd = node(at: index)
        return remove(node: nd)
        // 方式二：
        /*
        if index == 0 {
            if let hd = head {
                if hd.next === hd {
                    head = nil
                    return
                }
                let lastNode = last!
                head = hd.next
                lastNode.next = head
                hd.next = nil
            }
        } else {
            let prev = node(at: index - 1)
            let temp = prev.next
            prev.next = temp?.next
            temp?.next = nil
        }
         */
    }
    
    @discardableResult public func remove(node: CLNode) -> T {
        if head === node {
            if node.next === head {
                head = nil
                return node.value
            }
            let lastNode = last!
            let temp = head
            head = head?.next
            lastNode.next = head
            temp?.next = nil
            return node.value
        } else {
            var prev = head!
            while let next = prev.next {
                if next === node {
                    break
                }
                prev = next
            }
            prev.next = node.next
            node.next = nil
            return node.value
        }
    }
    
}

extension SinglyLinkedCircularList {
    convenience init(array: [T]) {
        self.init()
        array.forEach { append($0) }
    }
}
