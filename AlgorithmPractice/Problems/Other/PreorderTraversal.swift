//
//  PreorderTraversal.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/14.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class PreorderTraversal {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        // 1. 递归
        //        guard let root = root else { return [] }
        //        return [root.val] + preorderTraversal(root.left) + preorderTraversal(root.right)
        // 2. 迭代
        var stack = [TreeNode]()
        var res = [Int]()
        var cur = root
        while cur != nil || !stack.isEmpty {
            if cur != nil {
                stack.append(cur!)
                res.append(cur!.val)
                cur = cur?.left
            } else {
                cur = stack.popLast()?.right
            }
        }
        return res
    }
}
