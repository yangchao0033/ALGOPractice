//
// Created by 超杨 on 2020/5/5.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

class ConvertSortedArrayToBinarySearchTree {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return helper(nums, 0, nums.count)
    }
    private func helper(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        guard left != right else { return nil }
        let mid = (left + right) / 2
        let root = TreeNode(nums[mid])
        root.left = helper(nums, left, mid)
        root.right = helper(nums, mid + 1, right)
        return root
    }
}
