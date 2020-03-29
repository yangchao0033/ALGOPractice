//
//  HasCycle.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/26.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

extension ListNode: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.val)
    }
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }
}

class HasCycle {
    // 哈希表法
    func hasCycle(_ head: ListNode?) -> Bool {
        var set: Set<ListNode> = []
        var cur = head
        while cur != nil {
            if set.contains(cur!) {
                return true
            } else {
                set.insert(cur!)
            }
            cur = cur?.next
        }
        return false
    }
    func hasCycle1(_ head: ListNode?) -> Bool {
        var fast = head, slow = head
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if fast === slow {
                return true
            }
        }
        return false
    }
    static func test() {
        let l1 = ListNode(3)
        let l2 = ListNode(2)
        let l3 = ListNode(0)
        let l4 = ListNode(-4)

        let n1 = ListNode(3)
        let n2 = ListNode(2)
        let n3 = ListNode(0)
        let n4 = ListNode(-4)

        l1.next = l2
        l2.next = l3
        l3.next = l4
        l4.next = l2

        n1.next = n2
        n2.next = n3
        n3.next = n4
        n4.next = nil

        print(HasCycle().hasCycle1(l1))
    }
}
