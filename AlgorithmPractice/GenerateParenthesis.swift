//
//  GenerateParenthesis.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/16.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class GenerateParenthesis {
    func generateParenthesis(_ n: Int) -> [String] {
        func helper(res: inout [String], str: String, open: Int, close: Int, max: Int) {
            if open + close == 2 * max {
                res.append(str)
            }
            if open < max {
                helper(res: &res, str: str + "(", open: open + 1, close: close, max: max)
            }
            if close < open {
                helper(res: &res, str: str + ")", open: open, close: close + 1, max: max)
            }
        }
        var res = [String]()
        helper(res: &res, str: "", open: 0, close: 0, max: n)
        return res
    }
}
