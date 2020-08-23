//
//  ListNode.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/25.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

 class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode {
    static func toNodeList(by array: [Int]) -> ListNode? {
        let nodes = array.map { ListNode($0) }
//        for i in 0..<nodes.count - 1 {
        for i in stride(from: 0, to: nodes.count - 1, by: 1) {
            nodes[i].next = nodes[i + 1]
        }
        return nodes.first
    }
    static func printNodeList(_ headNode: ListNode?) {
        var cur = headNode
        while cur != nil {
            print(cur?.val ?? -1)
            cur = cur?.next
        }
    }
    static func toArray(by head: ListNode?) -> [Int] {
        var cur = head
        var a = [Int]()
        while let ncr = cur {
            a.append(ncr.val)
            cur = ncr.next
        }
        debugPrint("debugLog: toArray is \(a)")
        return a
    }
}
