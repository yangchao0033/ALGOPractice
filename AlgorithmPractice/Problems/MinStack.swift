//
//  MinStack.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/1.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class MinStack {
    //    private var array = [Int]()
    //    private var helper = [Int]()
    //    /** initialize your data structure here. */
    //    init() {
    //
    //    }
    //
    //    func push(_ x: Int) {
    //        array.append(x)
    //        if helper.isEmpty || x <= helper.last! {
    //            helper.append(x)
    //        }
    //    }
    //
    //    func pop() {
    //        let top = array.popLast()
    //        let helperTop = helper.last
    //        if top == helperTop {
    //            var _ = helper.popLast()
    //        }
    //    }
    //
    //    func top() -> Int {
    //        array.last ?? Int.min
    //    }
    //
    //    func getMin() -> Int {
    //        helper.last ?? Int.min
    //    }
        private var array = [Int]()
        private var helper = [Int]()
        /** initialize your data structure here. */
        init() {
        }
        func push(_ x: Int) {
            array.append(x)
            if helper.isEmpty {
                helper.append(x)
            } else {
                helper.append(min(x, helper.last!))
            }
        }
        func pop() {
            _ = array.popLast()
            _ = helper.popLast()
        }
        func top() -> Int {
            array.last ?? Int.min
        }
        func getMin() -> Int {
            helper.last ?? Int.min
        }
}
