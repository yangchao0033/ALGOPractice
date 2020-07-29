//
//  ReverseList.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/25.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class ReverseList {
    // 迭代法
    func reverseList1(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(-1)
        var pa = head
        while let npa = pa {
            pa = npa.next
            npa.next = dummy.next
            dummy.next = npa
        }
        return dummy.next
    }
    // 递归法
    func reverseList(_ head: ListNode?) -> ListNode? {
        // 递归到末尾时结束
        if head == nil || head?.next == nil {
            return head
        }
        // 同上面的控制条件，递归到末尾返回为 倒数第二个 node，一次往前推
        let cur = reverseList(head?.next)
        // 将 head 下一个元素 next 指回 到 head，并断开 head 的 next
        head?.next?.next = head
        head?.next = nil
        return cur
    }
}
