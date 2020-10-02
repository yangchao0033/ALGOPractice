# 牛客-客户端-TOP20

`time: 2020-9-25`

#### [206. 反转链表](https://leetcode-cn.com/problems/reverse-linked-list/)

> O(n)

```swift
func reverseList(_ head: ListNode?) -> ListNode? {
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
```

#### [146. LRU缓存机制](https://leetcode-cn.com/problems/lru-cache/)

> get O(1) put O(1)

```swift
class LRUCache {

    private let capacity: Int
    private var cache: [Int: LRUNode] = [:]
    private var list = LRUList()

    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard capacity > 0 else { return -1 }
        guard let node = cache[key] else { return -1 }
        list.move2Head(node)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        guard capacity > 0 else { return }
        if let node = cache[key] {
            node.value = value
            list.move2Head(node)
            return
        }
        if cache.count == capacity {
            guard let last = list.removeTail() else { return }
            cache[last.key] = nil
        }
        let newNode = LRUNode(key, value)
        list.add2Head(newNode)
        cache[key] = newNode
    }
}

private class LRUList {
    private let head = LRUNode(-1, -1)
    private let tail = LRUNode(-1, -1)
    init() {
        head.next = tail
    }

    func add2Head(_ node: LRUNode) {
        node.next = head.next
        node.prev = head
        head.next?.prev = node
        head.next = node
    }

    func move2Head(_ node: LRUNode) {
        remove(node)
        add2Head(node)
    }

    func removeTail() -> LRUNode? {
        guard !isEmpty else { return nil }
        let lastTail = tail.prev!
        remove(lastTail)
        return lastTail
    }

    private func remove(_ node: LRUNode) {
        guard !isEmpty else { return }
        node.prev?.next = node.next
        node.next?.prev = node.prev
        node.prev = nil
        node.next = nil
    }

    private var isEmpty: Bool {
        head.next === tail
    }
    
}

private class LRUNode {
    var key: Int
    var value: Int
    var next: LRUNode?
    weak var prev: LRUNode?
    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
    }
}
```

#### [144. 二叉树的前序遍历](https://leetcode-cn.com/problems/binary-tree-preorder-traversal/)

```swift
// 深度优先
func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        func helper(_ p: TreeNode?) {
            guard let p = p else { return }
            res.append(p.val)
            helper(p.left)
            helper(p.right)
        }
        helper(root)
        return res
    }
// 迭代 O(n) O(h)
func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        guard let root = root else { return res }
        var stack = [root]
        while let node = stack.popLast() {
            res.append(node.val)
            if let right = node.right {
                stack.append(right)
            }
            if let left = node.left {
                stack.append(left)
            }
        }
        return res
    }
```

#### [94. 二叉树的中序遍历](https://leetcode-cn.com/problems/binary-tree-inorder-traversal/)

```swift
// 深度优先
func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        func dfs(_ r: TreeNode?) {
            guard let r = r else { return }
            dfs(r.left)
            res.append(r.val)
            dfs(r.right)
        }
        dfs(root)
        return res
    }
// 迭代
func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var root = root
        var res = [Int]()
        var stack = [TreeNode]()
        while !stack.isEmpty || root != nil {
            while root != nil {
                stack.append(root!)
                root = root?.left
            }
            if let top = stack.popLast() {
                res.append(top.val)
                root = top.right
            }
        }
        return res
    }	
```

#### [145. 二叉树的后序遍历](https://leetcode-cn.com/problems/binary-tree-postorder-traversal/)

```swift
// 深度优先
func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        func dfs(_ r: TreeNode?) {
            guard let r = r else { return }
            dfs(r.left)
            dfs(r.right)
            res.append(r.val)
        }
        dfs(root)
        return res
    }
// 迭代
func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        guard let root = root else { return res }
        var stack = [root]
        while let node = stack.popLast() {
            if let ln = node.left {
                stack.append(ln)
            }
            if let rn = node.right {
                stack.append(rn)
            }
            res.append(node.val)
        }
        return res.reversed()
    }
```

#### [141. 环形链表](https://leetcode-cn.com/problems/linked-list-cycle/)

```swift
func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                return true
            }
        }
        return false
    }
```

#### [215. 数组中的第K个最大元素](https://leetcode-cn.com/problems/kth-largest-element-in-an-array/)

```swift
	func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        var low = 0, high = nums.count - 1
        let target = nums.count - k
        while true {
            let index = partitionHelper(&nums, low, high)
            if index == target {
                return nums[index]
            } else if index < target {
                low = index + 1
            } else {
                high = index - 1
            }
        }
        return -1
    }
    
    private func partitionHelper(_ a: inout [Int], _ low: Int, _ high: Int) -> Int {
	      // 注意：测试用例中包括极端case（a数组为已排好序的n位数组）
        // 如果不使用随机数选择，会导致时间复杂度退化为 O(n^2)
        let x = Int.random(in: low...high)
        a.swapAt(x, high)
        let pivot = a[high]
        var i = low
        for j in low..<high {
            if a[j] < pivot {
                a.swapAt(i, j)
                i += 1
            }
        }
        a.swapAt(i, high)
        return i
    }
```

#### [剑指 Offer 40. 最小的k个数](https://leetcode-cn.com/problems/zui-xiao-de-kge-shu-lcof/)

```swift
	func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        if k == 0 || arr.count == 0 {
            return []
        }
        var arr = arr
        return quickSearch(&arr, 0, arr.count - 1, k - 1)
    }
    
    private func quickSearch(_ arr: inout [Int], _ low: Int, _ high: Int, _ target: Int) -> [Int] {
        let p = getPartition(&arr, low, high)
        if p == target {
            return [Int](arr[...p])
        }
        return p > target ?
        quickSearch(&arr, low, p - 1, target) :
        quickSearch(&arr, p + 1, high, target)
    }
    
    private func getPartition(_ arr: inout [Int], _ low: Int, _ high: Int) -> Int {
      	// 此处通过随机数选择，避免出现已排序数组的极端case
        let x = Int.random(in: low...high)
        arr.swapAt(x, high)
        let pivot = arr[high]
        var i = low
        for j in low..<high {
            if arr[j] < pivot {
                arr.swapAt(i, j)
                i += 1
            }
        }
        arr.swapAt(i, high)
        return i
    }
```

#### [232. 用栈实现队列](https://leetcode-cn.com/problems/implement-queue-using-stacks/)

```swift
class MyQueue {

    var addStack = [Int]()
    var deleteStack = [Int]()
    
    init() {
    }
    
    func push(_ value: Int) {
        addStack.append(value)
    }
    
    func pop() -> Int {
        guard let last = deleteStack.popLast() else {
            guard !addStack.isEmpty else { return -1 }
            while let top = addStack.popLast() {
                deleteStack.append(top)
            }
            return deleteStack.popLast()!
        }
        return last
    }
    
    func peek() -> Int {
        guard let last = deleteStack.last else {
            guard !addStack.isEmpty else { return -1 }
            while let top = addStack.popLast() {
                deleteStack.append(top)
            }
            return deleteStack.last!
        }
        return last
    }
    
    func empty() -> Bool {
        return addStack.isEmpty && deleteStack.isEmpty
    }
}
```

#### [225. 用队列实现栈](https://leetcode-cn.com/problems/implement-stack-using-queues/)

```swift
class MyStack {
    var queue = [Int]()
    init() {
    }
    
    func push(_ value: Int) {
        queue.append(value)
        var size = queue.count
        while size > 1 {
            queue.append(queue.removeFirst())
            size -= 1
        }
    }
    
    func pop() -> Int {
        guard !empty() else { return -1 }
        return queue.removeFirst()
    }
    
    func top() -> Int {
        guard !empty() else { return -1 }
        return queue.first!
    }
    
    func empty() -> Bool {
        return queue.isEmpty
    }
}
```

#### [19. 删除链表的倒数第N个节点](https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/)

```swift
	func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(-1)
        dummy.next = head
        var fast: ListNode? = dummy
        var count = n
        while count > 0 {
            fast = fast?.next
            count -= 1
        }
        var slow: ListNode? = dummy
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next
        }
        slow?.next = slow?.next?.next
        return dummy.next
    }
```

#### [445. 两数相加 II](https://leetcode-cn.com/problems/add-two-numbers-ii/)

> 注意，这个是正序链表，需要考虑结果反转

##### 解法一：先逆序，后累加

```swift
	func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        var stack1 = [ListNode]()
        var stack2 = [ListNode]()
        while l1 != nil || l2 != nil {
            if let n1 = l1 {
                stack1.append(n1)
            }
            if let n2 = l2 {
                stack2.append(n2)
            }
            l1 = l1?.next
            l2 = l2?.next
        }
        
        let dummy = ListNode(-1)
        var carry = 0
        while !stack1.isEmpty || !stack2.isEmpty || carry > 0 {
            var sum = 0
            if let n1 = stack1.popLast() {
                sum += n1.val
            }
            if let n2 = stack2.popLast() {
                sum += n2.val
            }
            sum += carry
            carry = sum / 10
            let newNode = ListNode(sum % 10)
            newNode.next = dummy.next
            dummy.next = newNode
        }
        return dummy.next
    }
```

##### 解法二：使用栈，不修改原来的链表结构

```swift
	func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        var stack1 = [ListNode]()
        var stack2 = [ListNode]()
        while l1 != nil || l2 != nil {
            if let n1 = l1 {
                stack1.append(n1)
            }
            if let n2 = l2 {
                stack2.append(n2)
            }
            l1 = l1?.next
            l2 = l2?.next
        }
        
        let dummy = ListNode(-1)
        var carry = 0
        while !stack1.isEmpty || !stack2.isEmpty || carry > 0 {
            var sum = 0
            if let n1 = stack1.popLast() {
                sum += n1.val
            }
            if let n2 = stack2.popLast() {
                sum += n2.val
            }
            sum += carry
            carry = sum / 10
            let newNode = ListNode(sum % 10)
            newNode.next = dummy.next
            dummy.next = newNode
        }
        return dummy.next
    }
```

#### [141. 环形链表](https://leetcode-cn.com/problems/linked-list-cycle/)

> 也可以使用 hash set 检测，但空间 O(n)

```swift
func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                return true
            }
        }
        return false
    }
```

#### [142. 环形链表 II](https://leetcode-cn.com/problems/linked-list-cycle-ii/)

```swift
func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while true {
            slow = slow?.next
            fast = fast?.next?.next
            if fast?.next == nil {
                return nil
            }
            if slow === fast {
                break
            }
        }
        slow = head
        while slow !== fast {
            slow = slow?.next
            fast = fast?.next
        }
        return slow
    }
```

#### [3. 无重复字符的最长子串](https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/)

##### 方法一：使用set

```swift
func lengthOfLongestSubstring(_ s: String) -> Int {
        var start = 0
        var end = 0
        var res = 0
        var set: Set<Character> = []
        let chars = Array(s)
        while end < chars.count && start < chars.count {
            if !set.contains(chars[end]) {
                set.insert(chars[end])
                res = max(res, end - start + 1)
                end += 1
            } else {
                set.remove(chars[start])
                start += 1
            }
        }
        return res
    }
```

##### 方法二：使用 hash

```swift
func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)
        var start = 0
        var end = 0
        var map = [Character: Int]()
        var ans = 0
        while end < chars.count {
            let curChar = chars[end]
            if let index = map[curChar] {
                start = max(start, index)
            }
            ans = max(ans, end - start + 1)
            map[curChar] = end + 1
            end += 1
        }
        return ans
    }
```

#### [剑指 Offer 52. 两个链表的第一个公共节点](https://leetcode-cn.com/problems/liang-ge-lian-biao-de-di-yi-ge-gong-gong-jie-dian-lcof/)

> 依据公式: l1 + c + l2 = l2 + c + l1
>
> 其中 l1 为 headA 节点的特有部分长度，l2 为 headB 节点的特有部分长度，c 为 双方公共长度

```swift
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
```

#### [20. 有效的括号](https://leetcode-cn.com/problems/valid-parentheses/)

```swift
func isValid(_ s: String) -> Bool {
        let map: [Character: Character] = ["(": ")", "[": "]", "{": "}"]
        let chars = Array(s)
        var stack = [Character]()
        for c in chars {
            if map[c] != nil {
                stack.append(c)
            } else {
                guard let x = stack.popLast(), map[x] == c else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
```

#### [21. 合并两个有序链表](https://leetcode-cn.com/problems/merge-two-sorted-lists/)

##### 方法一: 迭代法

```swift
	func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2 
        let dummy = ListNode(-1)
        var cur: ListNode? = dummy
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                cur?.next = l1
                l1 = l1?.next
            } else {
                cur?.next = l2
                l2 = l2?.next
            }
            cur = cur?.next
        }
        cur?.next = l1 != nil ? l1 : l2
        return dummy.next
    }
```

##### 方法二：递归法

```swift
	func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
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
```

#### 13. 合并K个已排序链表

##### 解法一：暴力法 O(NK)

```swift
	func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var lists = lists
        let dummy = ListNode(-1)
        var cur: ListNode? = dummy
        while true {
            var minNode: ListNode?
            var minPoint = -1
            for i in 0..<lists.count {
                if lists[i] == nil {
                    continue
                }
                if minNode == nil || lists[i]!.val < minNode!.val {
                    minNode = lists[i]
                    minPoint = i
                }
            }
            if minPoint == -1 {
                break
            }
            cur?.next = minNode
            cur = cur?.next
            lists[minPoint] = lists[minPoint]?.next
        }
        return dummy.next
    }
```



#### 14. 数组中相加为0的三元组

#### 二叉树层序遍历

#### 15. 二叉树的之字层序遍历

二叉树的深度

#### 16. 买卖股票的最佳时机

#### 17. 最长递增子序列

#### 18. 判断一个链表是否为回文结构

#### 19. 反转数字

#### 20. 二叉树中是否存在节点和为指定值的路径

#### 二叉树到所有叶子节点的路径和

#### 21. 重建二叉树

#### 二分查找

##### 两数之和

##### 数组中只出现一次的数

##### 移动0

##### 螺旋矩阵

##### 合并区间

##### 大数乘法

##### 有重复项数字的所有排列

##### 二进制中1的个数

##### 重建二叉树

##### 旋转数组

##### 寻找峰值





