//
//  BSTTraversal.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/16.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class BSTTraversal {
    // 二叉树后序遍历
        func postorderTraversal(_ root: TreeNode?) -> [Int] {
            // 递归
//            guard let root = root else { return [] }
//            var res = [Int]()
//            if let leftNode = root.left {
//                res = postorderTraversal(leftNode)
//            }
//            if let rightNode = root.right {
//                res = postorderTraversal(rightNode)
//            }
//            return res + [root.val]
            // 迭代 一
    //        guard let root = root else { return [] }
    //        var res = [Int]()
    //        var stack = [TreeNode]()
    //        stack.append(root)
    //        while !stack.isEmpty {
    //            let node = stack.popLast()!
    //            res.append(node.val)
    //            if let left = node.left {
    //                stack.append(left)
    //            }
    //            if let right = node.right {
    //                stack.append(right)
    //            }
    //        }
    //        return res.reversed()
            // 迭代 二
            guard let root = root else { return [] }
            var res = [Int]()
            var stack = [TreeNode]()
            var cur: TreeNode? = root
            while cur != nil || !stack.isEmpty {
                if cur != nil {
                    res.append(cur!.val)
                    stack.append(cur!)
                    cur = cur?.right
                } else {
                    cur = stack.popLast()!.left
                }
            }
            return res.reversed()
        }
        // 二叉树前序遍历
        func preorderTraversal(_ root: TreeNode?) -> [Int] {
            // 双条件迭代
    //        var res = [Int]()
    //        var stack = [TreeNode]()
    //        var cur = root
    //        while cur != nil || !stack.isEmpty {
    //            if cur != nil {
    //                res.append(cur!.val)
    //                stack.append(cur!)
    //                cur = cur?.left
    //            } else {
    //                cur = stack.popLast()!.right
    //            }
    //        }
    //        return res
            // 单条件迭代
            var res = [Int]()
            var stack = [TreeNode]()
            guard let root = root else { return res }
            stack.append(root)
            while !stack.isEmpty {
                let node = stack.popLast()!
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
        func inorderTraversal(_ root: TreeNode?) -> [Int] {
            var res = [Int]()
            guard root != nil else { return res }
            var stack = [TreeNode]()
            var cur = root
            while !stack.isEmpty || cur != nil {
                if cur != nil {
                    stack.append(cur!)
                    cur = cur!.left
                } else {
                    cur = stack.popLast()!
                    res.append(cur!.val)
                    cur = cur!.right
                }
            }
            return res
        }
        // N 叉树后序遍历
        // 迭代
    //    func postorder(_ root: NTreeNode?) -> [Int] {
    //        guard let root = root else { return [] }
    //        var res = [Int]()
    //        var stack = [NTreeNode]()
    //        stack.append(root)
    //        while !stack.isEmpty {
    //            let node = stack.popLast()!
    //            res.append(node.val)
    //            for child in node.children {
    //                stack.append(child)
    //            }
    //        }
    //        return res.reversed()
    //    }
        // 递归
    //    func postorder(_ root: NTreeNode?) -> [Int] {
    //        guard let root = root else { return [] }
    //        var res = [Int]()
    //        for child in root.children {
    //            res += postorder(child)
    //        }
    //        res.append(root.val)
    //        return res
    //    }
        // N 叉树 层遍历
    //    func levelorder(_ root: NTreeNode?) -> [[Int]] {
    //        var res = [[Int]]()
    //        guard let root = root else { return res }
    //        func helper(_ node: NTreeNode, _ level: Int) {
    //            if res.count <= level {
    //                res.append([Int]())
    //            }
    //            res[level].append(node.val)
    //            for child in node.children {
    //                helper(child, level + 1)
    //            }
    //        }
    //        helper(root, 0)
    //        return res
    //    }
        // N 叉树前序遍历
    //    func preorder(_ root: NTreeNode?) -> [Int] {
    //        guard let root = root else { return [] }
    //        var res = [Int]()
    //        res.append(root.val)
    //        for child in root.children {
    //            res += preorder(child)
    //        }
    //        return res
    //    }
        // N 叉前序递归
    //    func preorder(_ root: NTreeNode?) -> [Int] {
    //        guard let root = root else { return [] }
    //        var res = [Int]()
    //        var stack = [NTreeNode]()
    //        stack.append(root)
    //        while !stack.isEmpty {
    //            let node = stack.popLast()!
    //            res.append(node.val)
    //            for child in node.children.reversed() {
    //                stack.append(child)
    //            }
    //        }
    //        return res
    //    }
}
