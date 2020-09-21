//
//  TreeTags.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/9/5.
//  Copyright © 2020 superYang. All rights reserved.
//

import Foundation

// swiftlint:disable type_body_length file_length
class TreeTags {
    /*
     根据二叉树创建字符串
     https://leetcode-cn.com/problems/construct-string-from-binary-tree/
    */
    func tree2str(_ t: TreeNode?) -> String {
        guard let t = t else {
            return ""
        }
        if t.left == nil && t.right == nil {
            return "\(t.val)"
        }
        if t.right == nil {
            return "\(t.val)(\(tree2str(t.left)))"
        }
        return "\(t.val)(\(tree2str(t.left)))(\(tree2str(t.right)))"
    }
    
    /*
     二叉树的深度
     https://leetcode-cn.com/problems/er-cha-shu-de-shen-du-lcof/
     */
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let left = maxDepth(root.left)
        let right = maxDepth(root.right)
        return max(left, right) + 1
    }
    
    /*
     二叉树反转
     */
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        (root.left, root.right) = (invertTree(root.right), invertTree(root.left))
        return root
    }
    
    /*
     n 叉树先序
     */
    func preorder(_ root: NTreeNode?) -> [Int] {
        var res = [Int]()
        func preorderHelper(_ root: NTreeNode?) {
            guard let root = root else { return }
            res.append(root.val)
            root.children.forEach { preorderHelper($0) }
        }
        preorderHelper(root)
        return res
    }
    
    /*
     n 叉树后序
     */
    func postorder(_ root: NTreeNode?) -> [Int] {
        var res = [Int]()
        func postorderHelper(_ root: NTreeNode?) {
            guard let root = root else { return }
            root.children.forEach { postorderHelper($0) }
            res.append(root.val)
        }
        postorderHelper(root)
        return res
    }
    
    /*
     相同的树
     */
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        guard let p = p, let q = q else { return false }
        return p.val == q.val && isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }
    
    /*
     左叶子节点
     */
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var sum = 0
        if let left = root.left, left.left == nil && left.right == nil {
            sum += left.val
        }
        sum += sumOfLeftLeaves(root.left) + sumOfLeftLeaves(root.right)
        return sum
    }
    
    /*
     最大深度
     */
    func maxDepth(_ root: NTreeNode?) -> Int {
        guard let root = root else { return 0 }
        var maxVal = 0
        root.children.forEach { maxVal = max(maxVal, maxDepth($0)) }
        return maxVal + 1
    }
 
    /*
     镜像树
     */
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        let rootX = TreeNode(root.val)
        rootX.left = mirrorTree(root.right)
        rootX.right = mirrorTree(root.left)
        return rootX
    }
    
    /*
     二叉树的坡度
     */
    func findTilt(_ root: TreeNode?) -> Int {
        var x = 0
        func helper(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            let left = helper(root.left)
            let right = helper(root.right)
            x += abs(left - right)
            return left + right + root.val
        }
        _ = helper(root)
        return x
    }
    
    /*
     对称二叉树
     */
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        func helper(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            if p == nil && q == nil {
                return true
            }
            guard let p = p, let q = q else { return false }
            return p.val == q.val && helper(p.left, q.right) && helper(p.right, q.left)
        }
        return helper(root.left, root.right)
    }
    
    /*################################ 二叉树广度优先&层序遍历专题 #########################################*/
    /*
     从上到下打印二叉树
     */
    func levelOrder(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var res = [Int]()
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            res.append(node.val)
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        return res
    }
    /*
     剑指 Offer 32 - II. 从上到下打印二叉树 II
     */
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var res = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            let levelCount = queue.count
            var levelRes = [Int]()
            for _ in 0..<levelCount {
                let node = queue.removeFirst()
                levelRes.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            res.append(levelRes)
        }
        return res
    }
    /*
     103. 二叉树的锯齿形层次遍历
     */
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var res = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root)
        var leftPrint = true
        while !queue.isEmpty {
            let levelSize = queue.count
            var levelRes = [Int]()
            for _ in 0..<levelSize {
                let node = queue.removeFirst()
                levelRes.append(node.val)
                if let leftChild = node.left {
                    queue.append(leftChild)
                }
                if let rightChild = node.right {
                    queue.append(rightChild)
                }
            }
            if leftPrint {
                res.append(levelRes)
            } else {
                res.append(levelRes.reversed())
            }
            leftPrint = !leftPrint
        }
        return res
    }
    
    /*
     二叉树右视图
     */
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var res = [Int]()
        var queue = [root]
        while !queue.isEmpty {
            res.append(queue.last!.val)
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        return res
    }
    
    /*
     在每个树行中找到最大值
     */
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var queue = [root]
        var res = [Int]()
        while !queue.isEmpty {
            let rowSize = queue.count
            var rowMax = Int.min
            for _ in 0..<rowSize {
                let node = queue.removeFirst()
                rowMax = max(rowMax, node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            res.append(rowMax)
        }
        return res
    }
    
    /*
     二叉树行平均值
     */
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root = root else { return [] }
        var queue = [root]
        var res = [Double]()
        while !queue.isEmpty {
            let size = queue.count
            var sum = 0
            for _ in 0..<size {
                let node = queue.removeFirst()
                sum += node.val
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            res.append(Double(sum) / Double(size))
        }
        return res
    }
    
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var res = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            let levelCount = queue.count
            var levelRes = [Int]()
            for _ in 0..<levelCount {
                let node = queue.removeFirst()
                levelRes.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            res.append(levelRes)
        }
        return res.reversed()
    }
    
    /*
     找到最后一行最左边的节点
     */
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        guard let root = root else { return -1 }
        var queue = [root]
        var levelRes: [Int]!
        while !queue.isEmpty {
            let size = queue.count
            levelRes = [Int]()
            for _ in 0..<size {
                let node = queue.removeFirst()
                levelRes.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        return levelRes.first!
    }
    
    /* n叉树层级遍历 */
    func levelOrder(_ root: NTreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var queue = [root]
        var res = [[Int]]()
        while !queue.isEmpty {
            let size = queue.count
            var levelRes = [Int]()
            for _ in 0..<size {
                let node = queue.removeFirst()
                levelRes.append(node.val)
                for child in node.children {
                    queue.append(child)
                }
            }
            res.append(levelRes)
        }
        return res
    }
    
    /* 特定深度节点链表 */
    func listOfDepth(_ tree: TreeNode?) -> [ListNode?] {
        guard let tree = tree else { return [] }
        var queue = [tree]
        var res = [ListNode?]()
        while !queue.isEmpty {
            let size = queue.count
            let dummy = ListNode(-1)
            var cur: ListNode? = dummy
            for _ in 0..<size {
                let node = queue.removeFirst()
                cur?.next = ListNode(node.val)
                cur = cur?.next
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            res.append(dummy.next)
        }
        return res
    }
    
    /*
     二叉树的堂兄弟节点
     */
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        guard let root = root else { return false }
        var queue = [root]
        while !queue.isEmpty {
            let k = queue.count
            var count = 0
            for _ in 0..<k {
                let node = queue.removeFirst()
                var leftCheck = false, rightCheck = false
                if let left = node.left {
                    leftCheck = left.val == x || left.val == y
                    queue.append(left)
                }
                if let right = node.right {
                    rightCheck = right.val == x || right.val == y
                    queue.append(right)
                }
                if leftCheck && rightCheck {
                    return false
                }
                if leftCheck || rightCheck {
                    count += 1
                }
            }
            if count == 2 {
                return true
            }
            if count == 1 {
                return false
            }
        }
        return false
    }
    
    /*############################################## 二叉树深度优先遍历 ###################################################*/
    /*
     平衡二叉树
     */
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        func heightHelper(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            return max(heightHelper(node.left), heightHelper(node.right)) + 1
        }
        return abs(heightHelper(root.left) - heightHelper(root.right)) <= 1 &&
            isBalanced(root.left) &&
            isBalanced(root.right)
    }
    
    /*
     叶子节点相似的树
     */
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        func preHelper(_ p: TreeNode?, array: inout [Int]) {
            guard let p = p else { return }
            if p.left == nil && p.right == nil {
                array.append(p.val)
            }
            preHelper(p.left, array: &array)
            preHelper(p.right, array: &array)
        }
        var arr1 = [Int]()
        preHelper(root1, array: &arr1)
        var arr2 = [Int]()
        preHelper(root2, array: &arr2)
        return arr1 == arr2
    }
    
    /* 二叉树的所有路径 */
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else { return [] }
        var res = [String]()
        func preStringBuilder(_ p: TreeNode, pathStr: String) {
            if p.left == nil && p.right == nil {
                let path = pathStr + String(p.val)
                res.append(path)
                return
            }
            let newPath = "\(pathStr)\(p.val)->"
            if let leftNode = p.left {
                preStringBuilder(leftNode, pathStr: newPath)
            }
            if let rightNode = p.right {
                preStringBuilder(rightNode, pathStr: newPath)
            }
        }
        preStringBuilder(root, pathStr: "")
        return res
    }
    
    /*
     897. 递增顺序查找树
     */
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        let dummy = TreeNode(-1)
        var pre = dummy
        func helper(_ c: TreeNode?) {
            guard let c = c else { return }
            helper(c.left)
            c.left = nil
            pre.right = c
            pre = c
            helper(c.right)
        }
        helper(root)
        return dummy.right
    }
    
    /* 108. 将有序数组转换为二叉搜索树 */
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        func helper(start: Int, end: Int) -> TreeNode? {
            if start == end {
                return nil
            }
            let mid = (start + end) / 2
            let root = TreeNode(nums[mid])
            root.left = helper(start: start, end: mid)
            root.right = helper(start: mid + 1, end: end)
            return root
        }
        return helper(start: 0, end: nums.count)
    }
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else { return false }
        var has = false
        func helper(_ p: TreeNode?, tmpSum: Int) {
            guard has == false else { // 剪枝操作
                return
            }
            guard let p = p else { return }
            if p.left == nil && p.right == nil {
                let res = tmpSum + p.val
                if res == sum {
                    has = true
                }
                return
            }
            let nextSum = p.val + tmpSum
            if p.left != nil {
                helper(p.left, tmpSum: nextSum)
            }
            if p.right != nil {
                helper(p.right, tmpSum: nextSum)
            }
        }
        helper(root, tmpSum: 0)
        return has
    }
    
    func sortedArrayToBST1(_ nums: [Int]) -> TreeNode? {
        func helper(start: Int, end: Int) -> TreeNode? {
            if start == end {
                return nil
            }
            let mid = (start + end) / 2
            let root = TreeNode(nums[mid])
            root.left = helper(start: start, end: mid)
            root.right = helper(start: mid + 1, end: end)
            return root
        }
        return helper(start: 0, end: nums.count)
    }
    
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        if root.left != nil && root.right != nil {
            return min(minDepth(root.left), minDepth(root.right)) + 1
        }
        return max(minDepth(root.left), minDepth(root.right)) + 1
    }
}
