//
//  NTreeLevelorderTraversal.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/15.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class NTreeLevelorderTraversal {
    var res = [[Int]]()
    
    func levelOrder(_ root: NTreeNode?) -> [[Int]] {
        guard let root = root else { return []}
        func traversalNode(_ node: NTreeNode, _ level: Int) {
            if res.count <= level {
                res.append([Int]())
            }
            res[level].append(node.val)
            for child in node.children {
                traversalNode(child, level + 1)
            }
        }
        traversalNode(root, 0)
        return res
    }
}
