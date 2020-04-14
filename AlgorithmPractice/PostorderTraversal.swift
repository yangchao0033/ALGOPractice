//
//  PostorderTraversal.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/14.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class PostorderTraversal: NSObject {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        // 1. 递归
        //        guard let root = root else { return [] }
        //        return postorderTraversal(root.left) + postorderTraversal(root.right) + [root.val]
        // 2. 栈迭代
//        var stack = [TreeNode]()
//        var res = [Int]()
//        var cur = root
//        while cur != nil || !stack.isEmpty {
//            if cur != nil {
//                stack.append(cur!)
//                res.insert(cur!.val, at: 0)
//                cur = cur?.right
//            } else {
//                cur = stack.popLast()!.left
//            }
//        }
//        return res
        // 另一种迭代
        guard let root = root else { return [] }
        var stack = [TreeNode]()
        var res = [Int]()
        stack.append(root)
        while !stack.isEmpty {
            let node = stack.popLast()!
            res.append(node.val)
            if let left = node.left {
                stack.append(left)
            }
            if let right = node.right {
                stack.append(right)
            }
        }
        return res.reversed()
    }
}
