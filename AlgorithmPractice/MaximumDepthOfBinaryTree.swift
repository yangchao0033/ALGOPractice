//
// Created by 超杨 on 2020/4/23.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

class MaximumDepthOfBinaryTree {
    func maxDepth(_ root: TreeNode?) -> Int {
        // 解法一：类似求侧影视图
//        var depth = 0
//        helper(level: 0, depth: &depth, root: root)
//        return depth
//    }
//    func helper(level: Int, depth: inout Int, root: TreeNode?) {
//        guard let root = root else { return }
//        if depth == level {
//            depth += 1
//        }
//        if depth < level {
//            return
//        }
//        helper(level: level + 1, depth: &depth, root: root.left)
//        helper(level: level + 1, depth: &depth, root: root.right)
        // 解法二：递归(求出每个子树的最大深度递归)
//        guard let root = root else { return 0 }
//        let leftDeep = maxDepth(root.left)
//        let rightDeep = maxDepth(root.right)
//        return max(leftDeep, rightDeep) + 1
        // 方法三：DFS
        guard let root = root else { return  0 }
        var stack = [(TreeNode?, Int)]()
        stack.append((root, 1))

        var depth = 0
        while !stack.isEmpty {
            let cur = stack.popLast()!
            let node = cur.0
            let curDepth = cur.1
            if let node = node {
                depth = max(depth, curDepth)
                stack.append((node.left, curDepth + 1))
                stack.append((node.right, curDepth + 1))
            }
        }
        return depth
    }
}
