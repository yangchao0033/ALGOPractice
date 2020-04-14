//
//  LengthOfLargestSubstring.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/14.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class LengthOfLargestSubstring {
    func lengthOfLargestSubstring(_ s: String) -> Int {
            // 暴力法 O (n^3)
    //        let strs = [Character](s)
    //        let n = strs.count
    //        var maxLength = 0
    //        let isAllUnique = {(start: Int, end: Int, array: [Character] ) -> Bool in
    //            var set: Set<Character> = []
    //            for p in start..<end {
    //                if set.contains(strs[p]) {
    //                    return false
    //                }
    //                set.insert(strs[p])
    //            }
    //            return true
    //        }
    //        for i in 0..<n {
    //            for j in i+1...n {
    //                if isAllUnique(i, j, strs) {
    //                    maxLength = max(maxLength, j - i)
    //                }
    //            }
    //        }
    //        return maxLength
            // 2. 滑动窗口 + hashmap  时间 O(n) 空间 O(n)
    //        let strs = [Character](s)
    //        guard strs.count > 0 else { return 0 }
    //        var map = [Character: Int]()
    //        var left = 0
    //        var maxLength = 0
    //        for i in 0..<strs.count {
    //            if let duplicateIndex = map[strs[i]] {
    //                left = max(left, duplicateIndex + 1)
    //            }
    //            map[strs[i]] = i
    //            maxLength = max(maxLength, i - left + 1)
    //        }
    //        return maxLength
            // 3. 滑动窗口 + 桶
            let strs = [Character](s)
            var buket = [Int](repeating: -1, count: 256)
            var maxLength = 0
            var left = 0
            for i in 0..<strs.count {
                let charUnicode = Int(strs[i].unicodeScalars.first!.value)
                left = max(left, buket[charUnicode] + 1)
                buket[charUnicode] = i
                maxLength = max(maxLength, i - left + 1)
            }
            return maxLength
        }
}
