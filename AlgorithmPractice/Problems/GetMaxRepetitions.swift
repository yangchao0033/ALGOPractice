//
// Created by 超杨 on 2020/4/20.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

/// 题解: https://leetcode-cn.com/problems/count-the-repetitions/solution/java-1msxiang-xi-zhu-shi-by-feixiang-4/356446/
class GetMaxRepetitions {
    func getMaxRepetitions(_ s1: String, _ n1: Int, _ s2: String, _ n2: Int) -> Int {
        // 法一
        guard n1 != 0 else {
            return 0
        }
        let c1 = [Character](s1)
        let c2 = [Character](s2)
        var counts1 = 0 //经历多少s1
        var counts2 = 0 //经历多少s2
        var p = 0 //当前在s2的位置
        var mp = [Int: (Int, Int)]() //记录每一次s1扫描结束后当前的状态，寻找循环
        while counts1 < n1 {
            for char in c1 where char == c2[p] { //往前
                p += 1
                if p == c2.count { //s2扫描结束从头开始循环
                    p = 0
                    counts2 += 1
                }
            }
            counts1 += 1
            if let (tuple0, tuple1) = mp[p] { // 出现循环，这次结束后 p 的位置和以前某一次一样，就是循环
                let circle1 = counts1 - tuple0 // 一个循环节有多少个 s1
                let circle2 = counts2 - tuple1 // 一个循环节有多少个 s2
                let leftS1Count: Int = n1 - counts1 // 剩余的 s1 的个数
                // TODO_note: [4/1/2090] 还是看不懂
                let leftCircleSectionCount: Int = leftS1Count / circle1
                counts2 += circle2 * leftCircleSectionCount
                counts1 += leftCircleSectionCount * circle1
            } else {
                mp[p] = (counts1, counts2) // 记录当前状态
            }
        }
        return counts2 / n2
    }
}
