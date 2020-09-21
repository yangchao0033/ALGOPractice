//
//  LinkedBinaryTree.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/9/5.
//  Copyright © 2020 superYang. All rights reserved.
//

import Foundation

class LinkedBinaryTree<T> {
    class LBTreeNode<T> {
        var data: T
        var left: LBTreeNode?
        var right: LBTreeNode?
        init(_ data: T) {
            self.data = data
        }
    }
    
    private(set) var root: LBTreeNode<T>?
    
    init() {}
    
    var isEmpty: Bool {
        return root == nil
    }
    
    func depth(_ root: LBTreeNode<T>?) -> Int {
        if root == nil {
            return 0
        }
        var i = 0, j = 0
        if root?.left != nil {
            i = depth(root?.left)
        } else {
            i = 0
        }
        if root?.right != nil {
            j = depth(root?.right)
        } else {
            j = 0
        }
        return max(i + 1, j + 1)
    }
    
    func preOrderTraverse(_ root: LBTreeNode<T>?) {
        guard root != nil else {
            return
        }
        visit(e: root!.data)
        preOrderTraverse(root?.left)
        preOrderTraverse(root?.right)
    }
    
    func inOrderTraverse(_ root: LBTreeNode<T>?) {
        guard let root = root else {
            return
        }
        inOrderTraverse(root.left)
        visit(e: root.data)
        inOrderTraverse(root.right)
    }
    
    func postOrderTracerse(_ root: LBTreeNode<T>?) {
        guard let root = root else {
            return
        }
        postOrderTracerse(root.left)
        postOrderTracerse(root.right)
        visit(e: root.data)
    }
    
    private func visit(e: T) {
        print(e)
    }
}
