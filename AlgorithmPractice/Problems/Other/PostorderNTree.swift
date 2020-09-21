//
//  PostorderNTree.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/14.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class PostorderNTree {
    func postorderNTree(_ root: NTreeNode?) -> [Int] {
            // 递归
    //        guard let root = root else { return [] }
    //        var res = [Int]()
    //        for child in root.children {
    //            res += postorderNTree(child)
    //        }
    //        res += [root.val]
    //        return res
            // 迭代
    //        guard root != nil else { return [] }
    //        var stack = [NTreeNode]()
    //        var res = [Int]()
    //        var cur = root
    //        stack.append(cur!)
    //        while !stack.isEmpty {
    //            cur = stack.popLast()
    //            res.insert(cur!.val, at: 0)
    //            for child in cur!.children {
    //                stack.append(child)
    //            }
    //        }
    //        return res
            // 另一种迭代
            guard let root = root else { return [] }
            var stack = [NTreeNode]()
            var res = [Int]()
            stack.append(root)
            while !stack.isEmpty {
                let node = stack.popLast()!
                res.append(node.val)
                for child in node.children {
                    stack.append(child)
                }
            }
            return res.reversed()
        }
}
