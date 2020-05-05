//
// Created by 超杨 on 2020/4/22.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

class ValidateBinarySearchTree {
    func isValidBST(_ root: TreeNode?) -> Bool {
//        // 法一：上下边界递归
//        // 1. 二叉搜索树基本条件之外，隐含条件为左子树和的所有元素必须都小于根节点，右子树亦然
//        // 2. 设置上下边界进行检查
//        func helper(_ root: TreeNode?, _ lower: Int?, _ upper: Int?) -> Bool {
//            // 叶子节点直接返回 true
//            guard let root = root else { return true }
//            // 验证上下边界
//            let val = root.val
//            if let lower = lower {
//                if val <= lower { return false }
//            }
//            if let upper = upper {
//                if val >= upper { return false }
//            }
//            // 向下层递归
//            if !helper(root.left, lower, val) { return false }
//            if !helper(root.right, val, upper) { return false }
//            return true
//        }
//        return helper(root, nil, nil)
        // 法二：中序遍历
        // 1. 中序遍历天然为有序数组
        // 2。 比较每次遍历出的数据是否小于前一个元素，否则判定为错误，
        guard let root = root else { return true }
        var stack = [TreeNode]()
        var cur: TreeNode? = root
        var lastVal = Int.min
        while !stack.isEmpty || cur != nil {
            if cur != nil {
                stack.append(cur!)
                cur = cur?.left
            } else {
                cur = stack.popLast()!
                guard cur!.val > lastVal else { return false }
                lastVal = cur!.val
                cur = cur!.right
            }
        }
        return true
    }
}
