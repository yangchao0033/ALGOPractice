//
//  MergeTwoSortedLists.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/30.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class MergeTwoSortedLists {
     func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            // 1. 前缀指针
    //        var l1 = l1
    //        var l2 = l2
    //        let dummy = ListNode(-1)
    //        var prev: ListNode? = dummy
    //        while l1 != nil && l2 != nil {
    //            if l1!.val < l2!.val {
    //                prev?.next = l1
    //                l1 = l1?.next
    //            } else {
    //                prev?.next = l2
    //                l2 = l2?.next
    //            }
    //            prev = prev?.next
    //        }
    //        prev?.next = l1 == nil ? l2 : l1
    //        return dummy.next
            // 2. 递归
            // 递归
            guard let l1 = l1 else { return l2 }
            guard let l2 = l2 else { return l1 }
            if l1.val < l2.val {
                l1.next = mergeTwoLists(l1.next, l2)
                return l1
            } else {
                l2.next = mergeTwoLists(l1, l2.next)
                return l2
            }
        }
}
