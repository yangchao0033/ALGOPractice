//
// Created by 超杨 on 2020/4/26.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

class MinimumDepthOfBinaryTree {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        if root.left == nil && root.right == nil {
            return 1
        }
        var minDepthValue = Int.max
        if let left = root.left {
            minDepthValue = min(minDepthValue, minDepth(left))
        }
        if let right = root.right {
            minDepthValue = min(minDepthValue, minDepth(right))
        }
        return minDepthValue + 1
    }
}
