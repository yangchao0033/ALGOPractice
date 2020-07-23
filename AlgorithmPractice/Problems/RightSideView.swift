//
// Created by 超杨 on 2020/4/22.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

class RightSideView {
    // 递归
    // 1. 终止条件 root 为 nil 说明层级已递归完成
    // 2. 当层级和 view 数组长度相同时，说明该层还未填充数据，对数据进行填充
    //
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        helper(root, 0, &res)
        return res
    }
    func helper(_ root: TreeNode?, _ level: Int, _ res: inout [Int]) {
        guard let root = root else { return }
        if level == res.count {
            res.append(root.val)
        } else if level > res.count {
            return
        }
        helper(root.right, level + 1, &res)
        helper(root.left, level + 1, &res)
    }
}
