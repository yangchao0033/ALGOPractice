//
// Created by 超杨 on 2020/5/7.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

class SubtreeOfAnotherTree {
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        // 1. s t 相等
        // 2. t 是 s 的左子树
        // 3. t 是 s 的右子树
        if s == nil && t == nil { return true }
        if s == nil || t == nil { return false }
        return isSameTree(s, t) || isSubtree(s?.left, t) || isSubtree(s?.right, t)
    }
    func isSameTree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        // 1. 都是 nil 则相等
        // 2. 一个为 nil 一个有值，不相等
        // 3. 根节点值相等且左子树相等且右子树相等
        if s == nil && t == nil { return true }
        if s == nil || t == nil { return false }
        return s?.val == t?.val && isSameTree(s?.left, t?.left) && isSameTree(s?.right, t?.right)
    }
}
