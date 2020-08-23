//
//  RandomNode.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/7/31.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

public class RNode {
     public var val: Int
     public var next: RNode?
     public var random: RNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
           self.random = nil
     }
 }

extension RNode: Equatable {
    public static func == (lhs: RNode, rhs: RNode) -> Bool {
        return lhs === rhs
    }
}

extension RNode: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
