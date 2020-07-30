//
//  ReverseKGroupList.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/29.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class ReverseKGroupList {
    // 指针法
    func reverseKGroup(head: ListNode?, k: Int) -> ListNode? {
        // 1. 创建哑节点
        let dummy = ListNode(-1)
        dummy.next = head
        var pre: ListNode? = dummy
        var tail: ListNode? = dummy
        while true {
            var count = 0
            while tail != nil && count != k {
                count += 1
                tail = tail?.next
            }
            // 判断是否结束
            if tail == nil { break }
            // 记录重置位
            let reversedTail = pre?.next
            while pre?.next !== tail {
                let cur = pre?.next
                pre?.next = cur?.next
                cur?.next = tail?.next
                tail?.next = cur
            }
            pre = reversedTail
            tail = reversedTail
        }
        return dummy.next
    }
}
