//
//  LinkedListTags.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/7/28.
//  Copyright © 2020 superYang. All rights reserved.
//

import Foundation
// swiftlint:disable file_length type_body_length
class LinkedListTags {
    /*
     https://leetcode-cn.com/problems/shan-chu-lian-biao-de-jie-dian-lcof/
     给定单向链表的头指针和一个要删除的节点的值，定义一个函数删除该节点。
     返回删除后的链表的头节点。
     */
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummy: ListNode? = ListNode(-1)
        dummy?.next = head
        var cur = head // 记录当前迭代的指针
        var prev = dummy // 记录前驱
        while let ncur = cur { // 使用 while let 语法特性更简洁
            if ncur.val == val {
                prev?.next = ncur.next
                break
            }
            prev = ncur
            cur = ncur.next
        }
        return dummy?.next
    }
    
    /*
     https://leetcode-cn.com/problems/delete-middle-node-lcci/
     删除中间节点
     */
    func deleteNode(_ node: ListNode?) {
        guard let next = node?.next else { return }
        node?.val = next.val
        node?.next = next.next
    }
    /*
     删除 mink 到 maxk之间的节点
     */
    func delete(head: ListNode?, from mink: Int, to maxk: Int) {
        var p = head
        var pre = head
        while let cur = p, cur.val < mink {// 找到前一个值
            pre = cur
            p = cur.next
        }
        while let cur = p, cur.val <= maxk { // 找到后一个值
            p = cur.next
        }
        pre?.next = p
    }
    
    /*
     删除链表中重复的节点
     https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/
     */
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var p = head
        while let np = p, let npNext = p?.next {
            if np.val == npNext.val {
                np.next = npNext.next
            } else {
                p = np.next
            }
        }
        return head
    }
    /*
     删除链表中重复的节点
     https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list-ii/
     */
    func deleteDuplicatesII(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(-1)
        dummy.next = head
        var cur: ListNode? = dummy
        while let curNext = cur?.next, let curNextNext = cur?.next?.next {
            if curNext.val == curNextNext.val {
                var temp: ListNode? = curNext
                while let tempN = temp, let tempNext = tempN.next, tempN.val == tempNext.val {
                    temp = tempNext
                }
                cur?.next = temp?.next
            } else {
                cur = cur?.next
            }
        }
        return dummy.next
    }
    /*
     删除链表倒数第N个节点
     https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/
     */
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        // 1. 暴力法 时间 O(n), 空间 O(1) 三次循环
        //        let l1 = reverseList(head)
        //        var i = 1
        //        let dummy = ListNode(-1)
        //        dummy.next = l1
        //        var pre = dummy
        //        var cur = l1
        //        while let p = cur {
        //            if i == n {
        //                pre.next = p.next
        //            }
        //            cur = p.next
        //            pre = p
        //            i += 1
        //        }
        //        let l2 = reverseList(dummy.next)
        //        return l2
        // 2. 一遍扫描 时间 O(n) 空间 O(n)
        //        let dummy = ListNode(-1)
        //        dummy.next = head
        //        var arr = [ListNode]()
        //        var cur: ListNode? = dummy
        //        while let p = cur {
        //            arr.append(p)
        //            cur = p.next
        //        }
        //        let pre = arr[arr.count - n - 1]
        //        pre.next = pre.next?.next
        //        return dummy.next
        // 3. 一遍扫描，快慢指针 时间 O(n) 空间 O(1)
        let dummy = ListNode(-1)
        dummy.next = head
        var fast: ListNode? = dummy
        var slow: ListNode? = dummy
        var i = 0
        while fast != nil && i <= n {
            fast = fast?.next
            i += 1
        }
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }
        slow?.next = slow?.next?.next
        return dummy.next
    }
    func reverseList(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(-1)
        var pa = head
        while let npa = pa {
            pa = npa.next
            npa.next = dummy.next
            dummy.next = npa
        }
        return dummy.next
    }
    
    /*
     删除链表中所有绝对值相等的节点
     n 为绝对值的最大值
     .例如,链表A = {21,-15,15,-7,15}, 删除后的链表A={21,-15,-7};
     */
    func deleteDuplicateABSNode(_ head: ListNode?, _ n: Int) -> ListNode? {
        var flagArray = [Int](repeating: 0, count: n) // 桶结构
        let dummy = ListNode(-1)
        dummy.next = head
        var pre: ListNode? = dummy
        var cur = head
        while let curN = cur {
            if flagArray[abs(curN.val)] == 1 { // 已标记准备删除
                pre?.next = curN.next
                cur = pre?.next
            } else {
                flagArray[abs(curN.val)] = 1
                pre = curN
                cur = curN.next
            }
        }
        return dummy.next
    }
    
    /*
     https://leetcode-cn.com/problems/intersection-of-two-linked-lists-lcci/
     链表相交（原题看链接）
     找到两个链表相交的节点
     */
    func getIntersectionNode(headA: ListNode?, headB: ListNode?) -> ListNode? {
        var t1 = headA
        var t2 = headB
        while t1 !== t2 {
            if t1 == nil {
                t1 = headB
            } else {
                t1 = t1?.next
            }
            if t2 == nil {
                t2 = headA
            } else {
                t2 = t2?.next
            }
        }
        return t1
    }
    
    /*
     https://leetcode-cn.com/problems/odd-even-linked-list/
     奇偶链表
     
     给定一个单链表，把所有的奇数节点和偶数节点分别排在一起。请注意，这里的奇数节点和偶数节点指的是节点编号的奇偶性，而不是节点的值的奇偶性。
     请尝试使用原地算法完成。你的算法的空间复杂度应为 O(1)，时间复杂度应为 O(nodes)，nodes 为节点总数。
     */
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var odd = head
        var even = head?.next
        let evenHead = even
        while even != nil && even?.next != nil {
            odd?.next = odd?.next?.next
            odd = odd?.next
            even?.next = odd?.next
            even = even?.next
        }
        odd?.next = evenHead
        return head
    }
    /*
     环路检测
     给定一个有环链表，实现一个算法返回环路的开头节点。
     有环链表的定义：在链表中某个节点的next元素指向在它前面出现过的节点，则表明该链表存在环路。
     https://leetcode-cn.com/problems/linked-list-cycle-lcci/
     */
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if slow === fast {
                break
            }
        }
        guard fast != nil && fast?.next != nil else {
            // 检测出无环
            return nil
        }
        slow = head
        while slow != fast {
            slow = slow?.next
            fast = fast?.next
        }
        return fast
    }
    
    /*
     返回倒数第 N 个节点
     https://leetcode-cn.com/problems/kth-node-from-end-of-list-lcci/
     */
    func kthTolast(_ head: ListNode?, _ k: Int) -> Int {
        var fast = head
        var slow = head
        var i = 1
        while i <= k {
            fast = fast?.next
            i += 1
        }
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }
        return slow?.val ?? -1
    }
    
    /*
     从尾到头打印链表
     https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof/
     */
    func reversePrint(_ head: ListNode?) -> [Int] {
        // 迭代
        //        var res = [Int]()
        //        var cur = head
        //        while let curP = cur {
        //            res.insert(curP.val, at: 0)
        //            cur = cur?.next
        //        }
        //        return res
        
        // 递归
        guard let h = head else { return [] }
        return reversePrint(head?.next) + [h.val]
    }
    
    /**
     * 返回链表的中间节点
     * https://leetcode-cn.com/problems/middle-of-the-linked-list/
     */
    func middleNode(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
    
    /**
     * 判断是否为回文链表
     * https://leetcode-cn.com/problems/palindrome-linked-list-lcci/
     */
    func isPalindrome(_ head: ListNode?) -> Bool {
        // 方法一：使用辅助空间
        //        var a1 = [Int]()
        //        var a2 = [Int]()
        //        var cur = head
        //        while let curP = cur {
        //            a1.insert(curP.val, at: 0)
        //            a2.append(curP.val)
        //            cur = cur?.next
        //        }
        //        return a1 == a2
        var middle: ListNode?
        var slow = head
        var fast = head
        while fast?.next != nil && fast?.next?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        middle = slow
        
        let dummy = ListNode(-1)
        var cur = middle?.next
        while cur != nil {
            let temp = cur?.next
            cur?.next = dummy.next
            dummy.next = cur
            cur = temp
        }
        let reversedHead = dummy.next
        
        var p = head
        var q = reversedHead
        while let curLeft = p, let curRight = q {
            if curLeft.val != curRight.val {
                return false
            }
            p = p?.next
            q = q?.next
        }
        return true
    }
    
    func isPalindrome2(_ head: ListNode?) -> Bool {
        // 方法二：使用回文对称性
        // 1. 找到中间节点（偶数取左边）
        // 2. 逆序后半段
        // 3. 遍历前后半段链表，如果值相等则为回文
        let middle = findMiddle(head)
        let rightHalfReverse = reverseHelper(middle?.next)
        var curLeft = head
        var curRight = rightHalfReverse
        while let curL = curLeft, let curR = curRight {
            if curL.val != curR.val {
                return false
            }
            curLeft = curLeft?.next
            curRight = curRight?.next
        }
        return true
    }
    func reverseHelper(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(-1)
        var cur = head
        while cur != nil {
            let temp = cur?.next
            cur?.next = dummy.next
            dummy.next = cur
            cur = temp
        }
        return dummy.next
    }
    func findMiddle(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        while fast?.next != nil && fast?.next?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
    
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var p = headA
        var q = headB
        while p !== q {
            if p == nil {
                p = headB
            } else {
                p = p?.next
            }
            if q == nil {
                q = headA
            } else {
                q = q?.next
            }
        }
        return p
    }
    /**
     *https://leetcode-cn.com/problems/convert-binary-number-in-a-linked-list-to-integer/
     *二进制链表转整数
     */
    func getDecimalValue(_ head: ListNode?) -> Int {
        var sum = 0
        var cur = head
        while let curP = cur {
            sum = sum * 2 + curP.val
            cur = cur?.next
        }
        return sum
    }
    /**
     * https://leetcode-cn.com/problems/remove-duplicate-node-lcci/
     * 移除未排序链表中的重复节点
     */
    func removeDuplicateNodes(_ head: ListNode?) -> ListNode? {
        // 使用集合
        var set: Set<Int> = []
        var cur = head
        while let curNode = cur, let next = curNode.next {
            set.insert(curNode.val)
            if set.contains(next.val) {
                cur?.next = cur?.next?.next
            } else {
                cur = cur?.next
            }
        }
        return head
        //        // 位运算
        //        var bits = [Int](repeating: 0, count: 20000 / 32 + 1)
        //        var cur = head
        //        while let node = cur, let next = node.next {
        //            bits[node.val / 32] |= 1 << (node.val % 32)
        //            if (bits[next.val / 32] & (1 << (next.val % 32))) != 0 {
        //                node.next = next.next
        //            } else {
        //                cur = next
        //            }
        //        }
        //        return head
    }
    /**
     * https://leetcode-cn.com/problems/partition-list-lcci/
     *  分割链表
     *  编写程序以 x 为基准分割链表，使得所有小于 x 的节点排在大于或等于 x 的节点之前。如果链表中包含 x，x 只需出现在小于 x 的元素之后(如下所示)。分割元素 x 只需处于“右半部分”即可，其不需要被置于左右两部分之间。
     */
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        // 方法一：使用两个哑节点
        let dummy0 = ListNode(-1)
        dummy0.next = head
        var pre: ListNode? = dummy0
        var cur = head
        let dummy1 = ListNode(-1)
        var cur1: ListNode? = dummy1
        while let curNode = cur {
            if curNode.val < x {
                pre?.next = curNode.next
                cur = curNode.next
                cur1?.next = curNode
                cur1 = cur1?.next
            } else {
                pre = cur
                cur = curNode.next
            }
        }
        cur1?.next = dummy0.next
        return dummy1.next
    }
    
    /**
     * https://leetcode-cn.com/problems/copy-list-with-random-pointer/
     * 复制带随机指针的链表
     */
    func copyRandomList(_ head: RNode?) -> RNode? {
//        let dummy = RNode(-1)
//        var dict = [RNode: RNode]()
//        var node: RNode? = dummy
//        var oriNode = head
//
//        while let ond = oriNode {
//            let newNode = RNode(ond.val)
//            dict[ond] = newNode
//            node?.next = newNode
//            node = newNode
//            oriNode = ond.next
//
//        }
//        oriNode = head
//        node = dummy.next
//        while let ond = oriNode {
//            if let rd = ond.random, let rdn = dict[rd] {
//                node?.random = rdn
//            }
//            oriNode = ond.next
//            node = node?.next
//        }
//        return dummy.next
        guard let hd = head else { return nil }
        var copyMap = [RNode: RNode]()
        var node = head
        while let nd = node {
            let copy = RNode(nd.val)
            copyMap[nd] = copy
            node = nd.next
        }
        node = head
        while let nd = node {
            if let next = node?.next {
                copyMap[nd]?.next = copyMap[next]
            }
            if let random = nd.random {
                copyMap[nd]?.random = copyMap[random]
            }
            node = nd.next
        }
        return copyMap[hd]
    }
    
    /**
     *  从链表中删去总和值为零的连续节点
     *  https://leetcode-cn.com/problems/remove-zero-sum-consecutive-nodes-from-linked-list/
     */
    func removeZeroSumSublists(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return nil
        }
        var dict = [Int: ListNode]()
        let dummy = ListNode(0)
        dummy.next = head
        var node = head
        var sum = 0
        while let nd = node {
            sum += nd.val
            dict[sum] = nd
            node = nd.next
        }
        node = dummy
        sum = 0
        while let nd = node {
            sum += nd.val
            if let targetNode = dict[sum] {
                nd.next = targetNode.next
            }
            node = nd.next
        }
        return dummy.next
    }
}

