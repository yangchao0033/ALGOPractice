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

#### [【牛客】二叉树的前序中序后序遍历](https://www.nowcoder.com/practice/a9fec6c46a684ad5a3abd4e365a9d362?tpId=194&&tqId=35806&rp=1&ru=/ta/job-code-high-client&qru=/ta/job-code-high-client/question-ranking)

```swift
func threeOrders(_ root: TreeNode?) -> [[Int]] {
        var preRes = [Int]()
        var inRes = [Int]()
        var postRes = [Int]()
        func order(_ r: TreeNode?) {
            guard let r = r else { return }
            preRes.append(r.val)
            order(r.left)
            inRes.append(r.val)
            order(r.right)
            postRes.append(r.val)
        }
        order(root)
        return [preRes, inRes, postRes]
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
        while end < chars.count {
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

#### [23. 合并K个升序链表](https://leetcode-cn.com/problems/merge-k-sorted-lists/)

##### 解法一：暴力法 O(NK)

```swift
	func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var lists = lists
        let dummy = ListNode(-1)
        var cur: ListNode? = dummy
        while true {
            var minNode: ListNode?
            var minIndex = -1
            for i in 0..<lists.count {
                guard lists[i] != nil else { continue }
                if minNode == nil || lists[i]!.val < minNode!.val {
                    minNode = lists[i]
                    minIndex = i
                }
            }
            guard minIndex != -1 else { break }
            cur?.next = minNode
            cur = cur?.next
            lists[minIndex] = lists[minIndex]?.next
        }
        return dummy.next
    }
```

##### 解法二：二分法 O(nlogk)

```swift
	func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        return mergeHelper(lists, 0, lists.count - 1)
    }

    func mergeHelper(_ lists: [ListNode?], _ low: Int, _ high: Int) -> ListNode? {
        guard low <= high else { return nil }
        if low == high {
            return lists[low]
        }
        let mid = low + (high - low) >> 1
        let l1 = mergeHelper(lists, low, mid)
        let l2 = mergeHelper(lists, mid + 1, high)
        return merge2list(l1, l2)
    }

    func merge2list(_ h1: ListNode?, _ h2: ListNode?) -> ListNode? {
        guard let h1 = h1 else { return h2 }
        guard let h2 = h2 else { return h1 }
        if h1.val < h2.val {
            h1.next = merge2list(h1.next, h2)
            return h1
        } else {
            h2.next = merge2list(h1, h2.next)
            return h2
        }
    }
```

#### [15. 三数之和](https://leetcode-cn.com/problems/3sum/)

> 1. 排序、排序、排序！
> 2. 三指针，第一个指针对应的值一定小于等于0
> 3. 三个指针都要去重，并且保证 lb < rb
> 4. sum 三种条件都要移动指针，否则会死循环

```swift
func threeSum(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        nums.sort()
        guard nums.count >= 3 else { return [] }
        var res = [[Int]]()
        for i in 0..<nums.count {
            let p = nums[i]
            guard p <= 0 else { break }
            if i > 0 && p == nums[i - 1] { continue }
            var lb = i + 1
            var rb = nums.count - 1
            while lb < rb {
                let sum = p + nums[lb] + nums[rb]
                if sum == 0 {
                    res.append([p, nums[lb], nums[rb]])
                    while  lb < rb && nums[lb] == nums[lb + 1] { lb += 1 }
                    while lb < rb && nums[rb] == nums[rb - 1] { rb -= 1 }
                    lb += 1
                    rb -= 1
                } else if (sum < 0) {
                    lb += 1
                } else {
                    rb -= 1
                }
            }
        }
        return res
}
```

#### [102. 二叉树的层序遍历](https://leetcode-cn.com/problems/binary-tree-level-order-traversal/)

```swift
func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var queue = [root]
        var res = [[Int]]()
        while !queue.isEmpty {
            let size = queue.count
            var row = [Int]()
            for _ in 0..<size {
                let top = queue.removeFirst()
                row.append(top.val)
                if let left = top.left {
                    queue.append(left)
                }
                if let right = top.right {
                    queue.append(right)
                }
            }
            res.append(row)
        }
        return res
}
```

#### [103. 二叉树的锯齿形层次遍历](https://leetcode-cn.com/problems/binary-tree-zigzag-level-order-traversal/)

```swift
	func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var res = [[Int]]()
        var queue = [root]
        var reverse = false
        while !queue.isEmpty {
            let size = queue.count
            var rows = [Int]()
            for _ in 0..<size {
                let top = queue.removeFirst()
                rows.append(top.val)
                if let ln = top.left {
                    queue.append(ln)
                }
                if let rn = top.right {
                    queue.append(rn)
                }
            }
            rows = reverse ? rows.reversed() : rows
            res.append(rows)
            reverse = !reverse
        }
        return res
    }
```



#### [104. 二叉树的最大深度](https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/)

```swift
	func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }
```

#### [121. 买卖股票的最佳时机](https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/)

```swift
func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max
        var maxProfit = 0
        for p in prices {
            if p < minPrice {
                minPrice = p // 尝试确认最低点
            } else {
                maxProfit = max(maxProfit, p - minPrice) // 尝试确认最大利润
            }
        }
        return maxProfit
    }
```



#### [234. 回文链表](https://leetcode-cn.com/problems/palindrome-linked-list/)

> 1. 找中点
> 2. 反转后半段
> 3. 前后是否相等

```swift
func isPalindrome(_ head: ListNode?) -> Bool {
        // 找中点
        var slow = head
        var fast = head
        while fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        let reversedHead = slow?.next

        let dummy = ListNode(-1)
        var cur = reversedHead
        while cur != nil {
            let temp = cur?.next
            cur?.next = dummy.next
            dummy.next = cur
            cur = temp
        }

        var p = head
        var q = dummy.next
        while p != nil && q != nil {
            if p!.val != q!.val { return false }
            p = p?.next
            q = q?.next
        }
        return true
    }
```



#### [【牛客】数组中未出现最小正整数](https://www.nowcoder.com/practice/8cc4f31432724b1f88201f7b721aa391?tpId=194&&tqId=35799&rp=1&ru=/ta/job-code-high-client&qru=/ta/job-code-high-client/question-ranking)

```swift
	func minNumberDisappeared(_ arr: [Int]) -> Int {
        var arr = arr
        for i in 0..<arr.count {
            let temp = arr[i]
            if arr[i] > 0 && temp <= arr.count {
                arr[i] = arr[temp - 1]
                arr[temp - 1] = temp
            }
        }
        for i in 0..<arr.count {
            if arr[i] != i + 1 {
                return i + 1
            }
        }
        return arr.count + 1
    }
```



#### [7. 整数反转](https://leetcode-cn.com/problems/reverse-integer/)

> 注意内存溢出

```swift
func reverse(_ x: Int) -> Int {
    var x = x
        var res = 0
        while x != 0 {
            let mod = x % 10
            x /= 10
            res = res * 10 + mod
        }
        return res < Int32.min || res > Int32.max ? 0 : res
  }
```

#### [【牛客】二分查找](https://www.nowcoder.com/practice/7bc4a1c7c371425d9faa9d1b511fe193?tpId=194&&tqId=35807&rp=1&ru=/ta/job-code-high-client&qru=/ta/job-code-high-client/question-ranking)

> 此处需要注意和力扣二分查找的条件不同

```swift
	func upperBound(_ n: Int,_ v: Int, _ a: [Int]) -> Int {
        guard n > 0 else { return n + 1 }
        guard v <= a[n - 1] else { return n + 1 }
        var left = 0, right = n - 1
        while left < right {
            let mid = left + (right - left) >> 1
            if a[mid] < v {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left + 1
    }
```

#### [1. 两数之和](https://leetcode-cn.com/problems/two-sum/)

```swift
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        for i in 0..<nums.count {
            if let idx = map[target - nums[i]] {
                return [idx, i]
            }
            map[nums[i]] = i;
        }
        return []
    }
```

#### [剑指 Offer 50. 第一个只出现一次的字符](https://leetcode-cn.com/problems/di-yi-ge-zhi-chu-xian-yi-ci-de-zi-fu-lcof/)

```swift
func firstUniqChar(_ s: String) -> Character {
        let chars = Array(s)
        var map = [Character: Bool]()
        for c in chars {
            map[c] = map[c] != nil ? false : true
        }
        for c in chars {
            if let v = map[c], v == true { return c }
        }
        return " "
    }
```

#### [54. 螺旋矩阵](https://leetcode-cn.com/problems/spiral-matrix/)

> 控制边界，依次向内收缩

```swift
func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var res = [Int]()
        guard !matrix.isEmpty && !matrix[0].isEmpty else { return res }
        let rows = matrix.count
        let cols = matrix[0].count
        var left = 0, right = cols - 1, top = 0, bottom = rows - 1
        while left <= right && top <= bottom {
            var col = left
            while col <= right {
                res.append(matrix[top][col])
                col += 1
            }
            var row = top + 1
            while row <= bottom {
                res.append(matrix[row][right])
                row += 1
            }
            if left < right && top < bottom {
                col = right - 1
                while col > left {
                    res.append(matrix[bottom][col])
                    col -= 1
                }
                row = bottom
                while row > top {
                    res.append(matrix[row][left])
                    row -= 1
                }
            }
            top += 1
            bottom -= 1
            left += 1
            right -= 1
        }
        return res
    }
```

#### [剑指 Offer 55 - II. 平衡二叉树](https://leetcode-cn.com/problems/ping-heng-er-cha-shu-lcof/)

```swift
func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return abs(maxHeightHelper(root.left) - maxHeightHelper(root.right)) <= 1 && isBalanced(root.left) && isBalanced(root.right)
    }

    func maxHeightHelper(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return max(maxHeightHelper(root.left), maxHeightHelper(root.right)) + 1
    }
```

#### [113. 路径总和 II](https://leetcode-cn.com/problems/path-sum-ii/)

> 注意：此题目和牛客的条件不太一样

```swift
func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var res = [[Int]]()
        func dfs(_ r: TreeNode?, _ path: [Int], _ s: Int) {
            guard let r = r else { return }
            if r.left == nil && r.right == nil && s == r.val {
                res.append(path + [r.val])
                return
            }
            dfs(r.left, path + [r.val], s - r.val)
            dfs(r.right, path + [r.val], s - r.val)
        }
        dfs(root, [], sum)
        return res
    }
```

#### [【牛客】二叉树根节点到所有叶子节点的所有路径和](https://www.nowcoder.com/practice/185a87cd29eb42049132aed873273e83?tpId=194&&tqId=35773&rp=1&ru=/ta/job-code-high-client&qru=/ta/job-code-high-client/question-ranking)

```swift
	func sumNumbers(_ root: TreeNode?) -> Int {
        var res = 0
        func helper(_ r: TreeNode?, _ sum: Int) {
            guard let r = r else { return }
            if r.left == nil && r.right == nil {
                res += (sum * 10 + r.val)
            }
            helper(r.left, sum * 10 + r.val)
            helper(r.right, sum * 10 + r.val)
        }
        helper(root, 0)
        return res
    }
```

#### [112. 路径总和](https://leetcode-cn.com/problems/path-sum/)

```swift
	func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else { return false }
        if root.left == nil && root.right == nil {
            return root.val == sum
        }
        return hasPathSum(root.left, sum - root.val) || hasPathSum(root.right, sum - root.val)
    }
```

#### [剑指 Offer 07. 重建二叉树](https://leetcode-cn.com/problems/zhong-jian-er-cha-shu-lcof/)

```swift
func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        // 预处理
        var dict = [Int: Int]()
        for i in 0..<inorder.count {
            dict[inorder[i]] = i
        }
        func helper(_ preRoot: Int, _ inLeft: Int, _ inRight: Int) -> TreeNode? {
            if inLeft > inRight { return nil }
            let root = TreeNode(preorder[preRoot])
            let mid = dict[preorder[preRoot]]!
            root.left = helper(preRoot + 1, inLeft, mid - 1)
            root.right = helper(preRoot + 1 + mid - inLeft, mid + 1, inRight)
            return root
        }
        return helper(0, 0, inorder.count - 1)
    }
```

#### [56. 合并区间](https://leetcode-cn.com/problems/merge-intervals/)

```swift
	func merge(_ intervals: [[Int]]) -> [[Int]] {
        var res = [[Int]]()
        guard !intervals.isEmpty else { return res }
        var intervals = intervals
        intervals.sort { $0[0] < $1[0] }
        res.append(intervals[0])
        for i in 0..<intervals.count {
            var lastIndex = res.count - 1
            if res[lastIndex][1] < intervals[i][0] {
                res.append(intervals[i])
            } else {
                res[lastIndex][1] = max(res[lastIndex][1], intervals[i][1])
            }
        }
        return res
    }
```

#### [【牛客】合并区间](https://www.nowcoder.com/practice/69f4e5b7ad284a478777cb2a17fb5e6a?tpId=194&&tqId=35780&rp=1&ru=/ta/job-code-high-client&qru=/ta/job-code-high-client/question-ranking)

```swift
	func merge(_ intervals: [Interval]) -> [Interval] {
        var intervals = intervals
        var res = [Interval]()
        guard !intervals.isEmpty else { return res }
        intervals.sort { $0.start < $1.start }
        res.append(intervals[0])
        for i in 0..<intervals.count {
            if intervals[i].start <= res.last!.end {
                res.last!.end = max(intervals[i].end, res.last!.end)
            } else {
                res.append(intervals[i])
            }
        }
        return res
    }
```

#### [43. 字符串相乘](https://leetcode-cn.com/problems/multiply-strings/)

```swift
func multiply(_ num1: String, _ num2: String) -> String {
        guard num1 != "0" && num2 != "0" else { return "0" }
        let m = num1.count, n = num2.count
        var res = [Int](repeating: 0, count: m + n)
        for (i, c1) in num1.enumerated().reversed() {
            let n1 = c1.wholeNumberValue!
            for (j, c2) in num2.enumerated().reversed() {
                let n2 = c2.wholeNumberValue!
                let sum = res[i + j + 1] + n1 * n2
                res[i + j + 1] = sum % 10
                res[i + j] += sum / 10
            }
        }
        var s = ""
        for i in 0..<res.count {
            if i == 0 && res[i] == 0 {
                continue
            }
            s.append(String(res[i]))
        }
        return s
    }
```



#### 有重复项数字的所有排列

##### 二进制中1的个数

##### 旋转数组

##### 寻找峰值

有关阶乘的两个问题1

正则表达式匹配

移动0

#### [容器盛水](https://www.nowcoder.com/practice/31c1aed01b394f0b8b7734de0324e00f?tpId=194&&tqId=35800&rp=1&ru=/ta/job-code-high-client&qru=/ta/job-code-high-client/question-ranking)

#### [最长递增子序列](https://www.nowcoder.com/practice/9cf027bf54714ad889d4f30ff0ae5481?tpId=194&rp=1&ru=%2Fta%2Fjob-code-high-client&qru=%2Fta%2Fjob-code-high-client%2Fquestion-ranking)





