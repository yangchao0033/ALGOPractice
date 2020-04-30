//
// Created by 超杨 on 2020/4/28.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

class SerializeAndDeserializeBinaryTree {
    func serialize(_ root: TreeNode?) -> String {
        let res = serializeHelper(root, "")
        return res
    }

    func serializeHelper(_ root: TreeNode?, _ str: String) -> String {
        guard let root = root else {
            return str + "null,"
        }
        // 使用递归先序遍历
        var str = str
        str += String(root.val) + ","
        str = serializeHelper(root.left, str)
        str = serializeHelper(root.right, str)
        return str
    }

    func deserialize(_ data: String) -> TreeNode? {
        let str = data
        var array = str.components(separatedBy: ",")
        return helper(array: &array)
    }

    func helper(array: inout [String]) -> TreeNode? {
        if array.first! == "null" {
            array.removeFirst()
            return nil
        }
        let root = TreeNode(Int(array.first ?? "" ) ?? 0)
        array.removeFirst()
        root.left = helper(array: &array)
        root.right = helper(array: &array)
        return root
    }
}
