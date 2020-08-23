//
//  BinaryTreeNode.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/14.
//  Copyright © 2020 superYang. All rights reserved.
//

class BinaryTreeNode<T> {
    var data: T
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    init(_ data: T) {
        self.data = data
    }
}
