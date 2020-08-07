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
        while slow !== fast {
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
    private func reverseHelper(_ head: ListNode?) -> ListNode? {
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
     *  编写程序以 x 为基准分割链表，使得所有小于 x 的节点排在大于或等于 x 的节点之前。
     *  如果链表中包含 x，x 只需出现在小于 x 的元素之后(如下所示)。分割元素 x 只需处于“右半部分”即可，其不需要被置于左右两部分之间。
     */
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        guard let head = head else { return nil }
        let dummy0 = ListNode(-1)
        let dummy1 = ListNode(-2)
        dummy0.next = head
        var maxNode: ListNode? = head
        var pre: ListNode? = dummy0
        var minNode: ListNode? = dummy1
        while let maxN = maxNode {
            if maxN.val < x {
                pre?.next = maxN.next
                minNode?.next = maxN
                minNode = maxN
                maxNode = pre?.next
            } else {
                maxNode = maxN.next
                pre = pre?.next
            }
        }
        minNode?.next = dummy0.next
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
    
    /**
     *  两数相加
     *  https://leetcode-cn.com/problems/add-two-numbers/
     */
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(-1)
        var cur: ListNode? = dummy
        var carry = false
        var node1 = l1
        var node2 = l2
        while node1 != nil || node2 != nil || carry {
            var sum = 0
            if let n1 = node1 {
                sum += n1.val
            }
            if let n2 = node2 {
                sum += n2.val
            }
            
            sum += carry ? 1 : 0
            carry = sum / 10 >= 1
            cur?.next = ListNode(sum % 10)
            cur = cur?.next
            node1 = node1?.next
            node2 = node2?.next
        }
        return dummy.next
    }
    
    /**
     * https://leetcode-cn.com/problems/add-two-numbers-ii/
     * 445. 两数相加II
     * 输入：(7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
     * 输出：7 -> 8 -> 0 -> 7
     */
    func addTwoNumbersII(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var node1 = l1
        var node2 = l2
        var stack1 = Stack<ListNode>()
        var stack2 = Stack<ListNode>()
        while node1 != nil || node2 != nil {
            if let n1 = node1 {
                stack1.push(n1)
            }
            if let n2 = node2 {
                stack2.push(n2)
            }
            node1 = node1?.next
            node2 = node2?.next
        }
        var carry = 0
        let dummy = ListNode(-1)
        while !stack1.isEmpty || !stack2.isEmpty || carry > 0 {
            var sum = 0
            if let n1 = stack1.pop() {
                sum += n1.val
            }
            if let n2 = stack2.pop() {
                sum += n2.val
            }
            sum += carry
            carry = sum / 10
            let cur = ListNode(sum % 10)
            cur.next = dummy.next
            dummy.next = cur
        }
        return dummy.next
    }
    
    /**
     *    https://leetcode-cn.com/problems/reorder-list/solution/
     *    重排链表
     *     给定一个单链表 L：L0→L1→…→Ln-1→Ln ，
     *     将其重新排列后变为： L0→Ln→L1→Ln-1→L2→Ln-2→…
     *     你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
     */
    func reorderList(_ head: ListNode?) {
        // 方法一：使用数组做辅助索引
        //        var array = [ListNode]()
        //        var node = head
        //        while let nd = node {
        //            array.append(nd)
        //            node = nd.next
        //        }
        //        guard array.count > 0 else { return }
        //        node = head
        //        var left = 0
        //        var right = array.count - 1
        //        while left < right {
        //            array[left].next = array[right]
        //            left += 1
        //            if left == right { // 个数为偶数，提前相遇
        //                break
        //            }
        //            array[right].next = array[left]
        //            right -= 1
        //        }
        //        array[left].next = nil
        // 方法二：折半切割 + 逆序 + 链表合并
        let middle = reorderListFindMiddleHelper(head)
        let reverse = reorderListReverseList(middle?.next)
        middle?.next = nil
        var node = head
        var re = reverse
        while re != nil {
            let temp = re?.next
            re?.next = node?.next
            node?.next = re
            node = re?.next
            re = temp
        }
    }
    func reorderListFindMiddleHelper(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        while fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
    func reorderListReverseList(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(-1)
        var node = head
        while node != nil {
            let temp = node?.next
            node?.next = dummy.next
            dummy.next = node
            node = temp
        }
        return dummy.next
    }
    
    /**
     * https://leetcode-cn.com/problems/reverse-linked-list-ii/
     * 92. 反转链表 II
     */
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        /*
         思路
         1. 迭代并找出反转区域的前一个节点 reversePre 和反转区域的最后一个节点 reverseTail
         2. 将反转区域反转
         3. 将 reversePre.next 指向反转区域头结点, 将 reverseTail.next 指向反转区域的后一个节点
         */
        // 记录链表头结点
        //        let dummy = ListNode(-1)
        //        dummy.next = head
        //        var node: ListNode? = dummy
        //        var pos = 0
        //        // 记录反转链表区域数据
        //        let reverseDummy = ListNode(-1)
        //        var reverseTail: ListNode? // 反转链表最后一个节点
        //        var reversePre: ListNode? // 反转链表前一个节点
        //        // 迭代链表
        //        while node != nil {
        //            if pos == m - 1 {
        //                reversePre = node
        //            }
        //            if pos >= m && pos <= n { // 开始反转
        //                if pos == m {
        //                    reverseTail = node
        //                }
        //                let temp = node?.next
        //                node?.next = reverseDummy.next
        //                reverseDummy.next = node
        //                node = temp
        //                if pos == n {
        //                    reverseTail?.next = temp
        //                }
        //            } else {
        //                node = node?.next
        //            }
        //            pos += 1
        //        }
        //        reversePre?.next = reverseDummy.next
        //        return dummy.next
        /*
         方法二：
         1. 将指针移动到 m
         2. 节点两两交换实现区域内反转
         */
        guard m <= n && head != nil else {
            return nil
        }
        let dummy = ListNode(-1)
        dummy.next = head
        var pre: ListNode? = dummy
        for _ in 0..<m-1 {
            pre = pre?.next
        }
        let node = pre?.next
        for _ in m..<n {
            let next = node?.next
            node?.next = next?.next
            next?.next = pre?.next
            pre?.next = next
        }
        return dummy.next
    }
    
    func splitListToParts(_ root: ListNode?, _ k: Int) -> [ListNode?] {
        // 1. 先遍历并计算size
        // 2. 求出每组应该放入的最大个数
        // 3. 遍历并装入数组
//        guard root != nil else {
//            return []
//        }
        var node = root
        var size = 0
        while node != nil {
            node = node?.next
            size += 1
        }

        let unitCount = size < k ? 1 : size / k
        let unitMod = size < k ? 0 : size % k
        node = root
        var curUnitCount = 0
        var curTotalCount = 0
        var res = [ListNode?]()
        var i = 0
        while curTotalCount < k {
            let next = node?.next
            if curUnitCount == 0 {
                res.append(node)
                curTotalCount += 1
                
            }
            curUnitCount += 1
            let maxUnitCount = unitCount + (curTotalCount <= unitMod ? 1 : 0)
            if curUnitCount == maxUnitCount {
                node?.next = nil
                curUnitCount = 0
            }
            node = next
            i += 1
        }
        return res
    }
    
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        // 快慢指针
        guard head != nil else {
            return nil
        }
        var n = 0
        var cur = head
        while cur != nil {
            n += 1
            cur = cur?.next
        }
        
        var k = k % n
        var slow = head
        var fast = head
        while k != 0 {
            fast = fast?.next
            k -= 1
        }
        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        fast?.next = head
        let h = slow?.next
        slow?.next = nil
        return h
    }
    
    // swiftlint:disable identifier_name
    /**
     *  https://leetcode-cn.com/problems/linked-list-components/
     *  817. 链表组件
     */
    func numComponents(_ head: ListNode?, _ G: [Int]) -> Int {
        // swiftlint:enable identifier_name
        var set = Set<Int>()
        G.forEach { set.insert($0) }
        var ans = 0
        var cur = head
        while let curVal = cur?.val {
            if set.contains(curVal) {
                if let nextVal = cur?.next?.val {
                    if !set.contains(nextVal) {
                        ans += 1
                    }
                } else {
                    ans += 1
                }
            }
            cur = cur?.next
        }
        return ans
    }
    
    /**
     *  https://leetcode-cn.com/problems/reverse-nodes-in-k-group/
     *  25. K 个一组翻转链表
     */
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        // 设定起止指针 & 前后指针
        let dummy = ListNode(-1)
        dummy.next = head
        var pre: ListNode? = dummy
        var end: ListNode? = dummy
        while end?.next != nil {
            var i = 0
            while i < k && end != nil {
                end = end?.next
                i += 1
            }
            guard end != nil else {
                break
            }
            let start = pre?.next
            let next = end?.next
            end?.next = nil
            pre?.next = reverseKGroupHelper(start)
            start?.next = next
            pre = start
            end = pre
        }
        return dummy.next
    }
    private func reverseKGroupHelper(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(-1)
        var cur = head
        while cur != nil {
            let next = cur?.next
            cur?.next = dummy.next
            dummy.next = cur
            cur = next
        }
        return dummy.next
    }
    
    /**
     *  21. 合并两个有序链表
     *  https://leetcode-cn.com/problems/merge-two-sorted-lists/
     */
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        let dummy = ListNode(-1)
        var tail: ListNode? = dummy
        while tail != nil {
            var minNode: ListNode? = l1
            if let n1 = minNode, let n2 = l2, n2.val < n1.val {
                minNode = l2
            }
            if minNode == nil {
                minNode = l1 != nil ? l1 : l2
            }
            tail?.next = minNode
            tail = tail?.next
            if minNode === l1 {
                l1 = l1?.next
            } else {
                l2 = l2?.next
            }
        }
        return dummy.next
    }
    
    /**
     *  23. 合并 K 个排序链表
     *  https://leetcode-cn.com/problems/merge-k-sorted-lists/
     */
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let k = lists.count
        var lists = lists
        let dummy = ListNode(-1)
        var trail: ListNode? = dummy
        while true {
            var minNode: ListNode?
            var minPoint: Int?
            for i in 0..<k {
                guard let listHead = lists[i] else { continue }
                if let minN = minNode {
                    if listHead.val < minN.val {
                        minNode = listHead
                        minPoint = i
                    }
                } else {
                    minNode = listHead
                    minPoint = i
                }
            }
            guard let index = minPoint else {
                break
            }
            trail?.next = minNode
            trail = trail?.next
            lists[index] = lists[index]?.next
        }
        
        return dummy.next
    }
    
}

/**
 *  707.设计链表
 *  https://leetcode-cn.com/problems/design-linked-list/
 */
class MyLinkedList {
    // 单链表
    /*
    class MLNode {
        var val: Int
        var next: MLNode?
        init(_ val: Int) {
            self.val = val
        }
    }
    
    let dummy = MLNode(-1)
    
    private var last: MLNode {
        var cur = dummy
        while let next = cur.next {
            cur = next
        }
        return cur
    }
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        guard let node = getNode(index) else { return -1 }
        return node.val
    }
    
    private func getNode(_ index: Int) -> MLNode? {
        let index = index + 1
        guard index >= 0 else {
            return nil
        }
        var cur: MLNode? = dummy
        var i = 0
        while cur != nil {
            if i == index {
                return cur
            }
            cur = cur?.next
            i += 1
        }
        return nil
    }
    
    func addAtHead(_ val: Int) {
        addAtIndex(0, val)
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        let node = MLNode(val)
        last.next = node
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        let index = index < 0 ? 0 : index
        let prev = getNode(index - 1)
        let node = MLNode(val)
        node.next = prev?.next
        prev?.next = node
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        guard index >= 0 else {
            return
        }
        let prev = getNode(index - 1)
        prev?.next = prev?.next?.next
    }
 */
    // 双向链表
    class MLNode {
        var val: Int
        var next: MLNode?
        var prev: MLNode?
        init(_ val: Int) {
            self.val = val
        }
    }

    let dummy = MLNode(-1)
    var size = 0
    init() {
        
    }
    
    func get(_ index: Int) -> Int {
        guard let node = getNode(index) else { return -1 }
        return node.val
    }
    
    func addAtHead(_ val: Int) {
        addAtIndex(0, val)
    }
    
    func addAtTail(_ val: Int) {
        addAtIndex(size, val)
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        let index = index >= 0 ? index : 0
        guard let pre = getNode(index - 1) else { return}
        let node = MLNode(val)
        node.next = pre.next
        pre.next?.prev = node
        node.prev = pre
        pre.next = node
        size += 1
    }
    
    func deleteAtIndex(_ index: Int) {
        guard index >= 0 else {
            return
        }
        guard let node = getNode(index) else { return }
        let pre = node.prev
        let next = node.next
        pre?.next = next
        next?.prev = pre
        node.prev = nil
        node.next = nil
        size -= 1
    }
    
    private func getNode(_ index: Int) -> MLNode? {
        let index = index + 1
        guard index >= 0 else {
            return nil
        }
        var cur: MLNode? = dummy
        var i = 0
        while cur != nil {
            if i == index {
                return cur
            }
            cur = cur?.next
            i += 1
        }
        return nil
    }
}

// swiftlint:enable file_length type_body_length
