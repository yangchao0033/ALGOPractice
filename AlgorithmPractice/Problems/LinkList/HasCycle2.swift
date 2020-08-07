//
//  hasCycle2.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/26.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class HasCycle2 {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        // 先检测是否有环
        var slow = head, fast = head
        while true {
            slow = slow?.next
            fast = fast?.next?.next
            if fast == nil || fast?.next == nil {
                return nil
            }
            if fast == slow {
                break
            }
        }
        fast = head
        // 计算从起点到入环口的步长
        while fast != slow {
            fast = fast?.next
            slow = slow?.next
        }
        return fast
    }
    func detectCycle1(_ head: ListNode?) -> ListNode? {
        var cur = head
        var set: Set<ListNode> = []
        while cur != nil {
            if set.contains(cur!) {
                return cur
            }
            set.insert(cur!)
            cur = cur?.next
        }
        return nil
    }
    func test() {
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
        if let node = self.detectCycle1(n1) {
            print(node.val)
        } else {
            print("no cycle")
        }
    }
}
