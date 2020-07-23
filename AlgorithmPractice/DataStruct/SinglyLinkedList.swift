//
//  SinglyLinkedList.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/7/23.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class Node<T> {
    var value: T?
    var next: Node?
    
    init(_ value: T) {
        self.value = value
    }
}

/// 单链表
