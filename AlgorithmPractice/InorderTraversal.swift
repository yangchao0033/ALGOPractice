//
//  InorderTraversal.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/14.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ data: Int) {
        self.val = data
    }
}

class InorderTraversal {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        // 1. 递归抽取
        //        func helper(root: TreeNode?, nums: inout [Int]) {
        //            guard let root = root else { return }
        //            if let left = root.left {
        //                helper(root: left, nums: &nums)
        //            }
        //            nums.append(root.val)
        //            if let right = root.right {
        //                helper(root: right, nums: &nums)
        //            }
        //        }
        //        var nums = [Int]()
        //        helper(root: root, nums: &nums)
        //        return nums
        // 2. 递归简化
        //        guard let root = root else { return [] }
        //        return inorderTraversal(root.left) + [root.val] + inorderTraversal(root.right)
        // 3. 栈迭代
        var nums = [Int]()
        var stack = [TreeNode?]()
        var curr = root
        while curr != nil || !stack.isEmpty {
            if curr != nil {
                stack.append(curr)
                curr = curr?.left
            } else {
                curr = stack.popLast()!
                nums.append(curr!.val)
                curr = curr?.right
            }
        }
        return nums
    }
}
