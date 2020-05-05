//
// Created by 超杨 on 2020/5/5.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ data: Int) {
        self.val = data
    }
}

// 序列化 & 反序列化 （仅限中序遍历）
extension TreeNode {
    /*
        5
       / \
     1   4
        / \
       3   6
    Input: [5,1,4,null,null,3,6] -> [5,1,null,null,4,3,null,null,6,null,null]
    */
    static func serialize(_ root: TreeNode?) -> String {
        var res = serializeHelper(root, "")
        res.removeLast()
        return "[" + res + "]"
    }
    static func deserialize(_ data: String) -> TreeNode? {
        var str = data
        str.removeFirst()
        str.removeLast()
        var array = str.components(separatedBy: ",")
        return deserializeHelper(array: &array)
    }

    private static func serializeHelper(_ root: TreeNode?, _ str: String) -> String {
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

    private static func deserializeHelper(array: inout [String]) -> TreeNode? {
        if array.first == "null" {
            array.removeFirst()
            return nil
        }
        let root = TreeNode(Int(array.first ?? "" ) ?? 0)
        array.removeFirst()
        root.left = deserializeHelper(array: &array)
        root.right = deserializeHelper(array: &array)
        return root
    }
}
