//
// Created by 超杨 on 2020/4/21.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

class InvertTree {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
//        guard root != nil else { return nil }
//        let temp = root?.left
//        root?.left = invertTree(root?.right)
//        root?.right = invertTree(temp)
//        return root
        guard root != nil else { return nil }
        var stack = [TreeNode]()
        stack.append(root!)
        while !stack.isEmpty {
            let current = stack.popLast()!
            let temp = current.left
            current.left = current.right
            current.right = temp
            if let left = current.left {
                stack.append(left)
            }
            if let right = current.right {
                stack.append(right)
            }
        }
        return root
    }
}
