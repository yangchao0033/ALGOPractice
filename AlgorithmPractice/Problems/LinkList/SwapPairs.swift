//
//  SwapPairs.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/25.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class SwapPairs {
    // 递归
    func swapPairs(_ head: ListNode?) -> ListNode? {
        // 1. 假设每次往前走，除了前两个节点，后续的节点都是已交换结束的
        // 2. 当交换到最后两个或一个时返回节点本身
        // 3. 将当前两个节点与后边的交换后的链表交换并连接
        guard head != nil && head?.next != nil else {
            return head
        }
        let originNext = head?.next
        head?.next = swapPairs(originNext?.next) // 一次跳两次
        originNext?.next = head
        return originNext
    }
    // 迭代
    func swapPairs1(_ head: ListNode?) -> ListNode? {
        // 1. 设计一个前驱节点，方便后面两两交换不会错位
        // 2. 每次交换 A B 节点以及前驱节点的指向
        var head = head
        let fakeHead = ListNode(-1) // 任何值都行, 最终会返回他的h后继
        fakeHead.next = head
        var pre = fakeHead
        while head != nil && head?.next != nil {
            // 区分 AB 节点配对
            let nodeA = head
            let nodeB = head?.next
            // swap
            pre.next = nodeB
            nodeA?.next = nodeB?.next
            nodeB?.next = nodeA
            // 准备下一次迭代
            pre = nodeA!
            head = nodeA?.next
        }
        return fakeHead.next
    }
    func test() {
        let head = ListNode.toNodeList(by: [1])
        ListNode.printNodeList(head)
        let swapHead = swapPairs1(head)
        ListNode.printNodeList(swapHead)
    }
}
