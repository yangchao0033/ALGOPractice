//
//  main.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/24.
//  Copyright © 2020 superYang. All rights reserved.
//

class Solution {
    func getMaxRepetitions(_ s1: String, _ n1: Int, _ s2: String, _ n2: Int) -> Int {
        // 法一
        guard n1 != 0 else {
            return 0
        }
        let c1 = [Character](s1)
        let c2 = [Character](s2)
        var counts1 = 0
        var counts2 = 0
        var p = 0
        var mp = [Int: (Int, Int)]()
        while counts1 < n1 {
            for char in c1 where char == c2[p] {
                p += 1
                if p == c2.count {
                    p = 0
                    counts2 += 1
                }
            }
            counts1 += 1
            if let (tuple0, tuple1) = mp[p] { // 出现循环，这次结束后 p 的位置和以前某一次一样，就是循环
                let circle1 = counts1 - tuple0
                let circle2 = counts2 - tuple1
                counts2 += circle2 * ((n1 - counts1) / circle1)
                counts1 += ((n1 - counts1) / circle1) * circle1
            } else {
                mp[p] = (counts1, counts2) // 记录当前状态
            }
        }
        return counts2 / n2
    }
}

debugPrint(ThreeSum().threeSum1([]))
