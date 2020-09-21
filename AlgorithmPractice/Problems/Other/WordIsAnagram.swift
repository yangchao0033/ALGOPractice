//
//  WordIsAnagram.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/9.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class WordIsAnagram {
    func isAnagram(_ s: String, _ t: String) -> Bool {
            // 暴力法 O(nLog(n))
//            return s.sorted() == t.sorted()
            // dict 法 O(n) = 2n
    //        guard s.count == t.count else {
    //            return false
    //        }
    //        let sChars = [Character](s)
    //        let tChars = [Character](t)
    //        var charCountMap = [Character: Int]()
    //        for i in 0..<s.count {
    //            if charCountMap[sChars[i]] != nil {
    //                charCountMap[sChars[i]]! += 1
    //            } else {
    //                charCountMap[sChars[i]] = 1
    //            }
    //            if charCountMap[tChars[i]] != nil {
    //                charCountMap[tChars[i]]! -= 1
    //            } else {
    //                charCountMap[tChars[i]] = -1
    //            }
    //        }
    //        for (_, value) in charCountMap where value != 0 {
    //            return false
    //        }
    //        return true
            // 3. 字母表 O(n) = n
            guard s.count == t.count else { return false }
            var counter = [Int](repeating: 0, count: 26)
            let aCharUnicodeScalar = Int("a".unicodeScalars.first!.value)
            for scalar in s.unicodeScalars {
                counter[Int(scalar.value) - aCharUnicodeScalar] += 1
            }
            for scalar in t.unicodeScalars {
                counter[Int(scalar.value) - aCharUnicodeScalar] -= 1
            }
            guard counter.first(where: { $0 != 0 }) == nil else { return false }
            return true
    }
}
