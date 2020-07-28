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
        let dummy: ListNode? = ListNode(-1)
        dummy?.next = l1
        var pc: ListNode? = dummy
        var pa = l1
        var pb = l2
        while let npa = pa, let npb = pb {
            if npa.val < npb.val {
                pc?.next = npa
                pc = npa
                pa = npa.next
            } else {
                pc?.next = npb
                pc = npb
                pb = npb.next
            }
        }
        pc?.next = pa != nil ? pa : pb
        
        return dummy?.next
        
        // 2. 递归
                    // 递归
        //            guard let l1 = l1 else { return l2 }
        //            guard let l2 = l2 else { return l1 }
        //            if l1.val < l2.val {
        //                l1.next = mergeTwoLists(l1.next, l2)
        //                return l1
        //            } else {
        //                l2.next = mergeTwoLists(l1, l2.next)
        //                return l2
        //            }
    }
    
    func mergeTwoLists3(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy: ListNode? = ListNode(-1)
        dummy?.next = l1
        var pc: ListNode? = dummy
        var pa = l1
        var pb = l2
        while let npa = pa, let npb = pb {
            if npa.val < npb.val {
                pc?.next = npa
                pc = npa
                pa = npa.next
            } else if npa.val > npb.val {
                pc?.next = npb
                pc = npb
                pb = npb.next
            } else {
                pc?.next = npa
                pc = npa
                pa = npa.next
                
                pb = pb?.next
                
            }
        }
        pc?.next = pa != nil ? pa : pb
        
        return dummy?.next
    }
}
