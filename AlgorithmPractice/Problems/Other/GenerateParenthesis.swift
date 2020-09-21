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
        // 反向
//        func helper(res: inout [String], _ s: String, _ open: Int, _ close: Int) {
//            if open == 0 && close == 0 {
//                res.append(s)
//                return
//            }
//            if open > close {
//                return
//            }
//            if open > 0 {
//                helper(res: &res, s + "(", open - 1, close)
//            }
//            if close > 0 {
//                helper(res: &res, s + ")", open, close - 1)
//            }
//        }
//
//        var res = [String]()
//        helper(res: &res, "", n, n)
//        return res
        // 正向
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
