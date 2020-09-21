//
//  NTreeNode.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/9/5.
//  Copyright © 2020 superYang. All rights reserved.
//

import Foundation

class NTreeNode {
    var val: Int
    var children: [NTreeNode]
    init(_ val: Int) {
        self.val = val
        children = []
    }
}
