//
//  main.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/24.
//  Copyright © 2020 superYang. All rights reserved.
//

class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        var res = 0
        func dfs(_ r: TreeNode?, _ sum: Int) {
            guard let r = r else { return }
            if r.left == nil && r.right == nil {
                res = sum * 10 + r.val
            }
            dfs(r.left, sum * 10 + r.val)
            dfs(r.right, sum * 10 + r.val)
        }
        dfs(root, 0)
        return res
    }
}


print("All is well")
