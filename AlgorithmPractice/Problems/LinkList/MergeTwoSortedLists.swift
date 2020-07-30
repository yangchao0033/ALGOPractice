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
                
                pb = npb.next
                
            }
        }
        pc?.next = pa != nil ? pa : pb
        
        return dummy?.next
    }
    
    /*
     变种题目
     一直两个链表 A、B表示两个集合，其元素递增排列，设计算法求出AB的交集，并存储在A链表中
     */
    func intersectionList1( _ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy: ListNode? = ListNode(-1)
        dummy?.next = l1
        var pa = l1
        var pb = l2
        var pc = dummy
        
        while let npa = pa, let npb = pb {
            if npa.val < npb.val {
                pa = npa.next
            } else if npa.val > npb.val {
                pb = npb.next
            } else {
                pc?.next = npa
                pc = pc?.next
                pa = npa.next
                
                pb = npb.next
            }
        }
        return dummy?.next
    }
}
