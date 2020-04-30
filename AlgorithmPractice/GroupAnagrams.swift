//
//  GroupAnagrams.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/9.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class GroupAnagrams {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
            // 暴力法 O(n^2以上) 超时
    //        var array = strs
    //        var res = [[String]]()
    //        while array.count != 0 {
    //            let p = array.removeLast()
    //            var group = [p]
    //            var i = array.count - 1
    //            while i >= 0 {
    //                if isAnagram(p, array[i]) {
    //                    group.append(array.remove(at: i))
    //                }
    //                i -= 1
    //            }
    //            res.append(group)
    //        }
    //        return res
            // 2. 排序 + hash表 O(nklogk)
    //        guard !strs.isEmpty else { return [[String]]() }
    //        var dict = [String: [String]]()
    //        for s in strs {
    //            let sortedS = s.sorted()
    //            let keyStr = String(sortedS)
    //            if dict[keyStr] == nil {
    //                dict[keyStr] = [String]()
    //            }
    //            dict[keyStr]?.append(s)
    //        }
    //        return Array(dict.values)
            // 3. 数组计数 + 哈希表
            guard !strs.isEmpty else { return [[String]]() }
            var hashMap = [[Int]: [String]]()
            for s in strs {
                var counter = [Int](repeating: 0, count: 26)
                let aScalar: UInt32 = 97
                for char in s {
                    let idx = Int(char.unicodeScalars.first!.value - aScalar)
                    counter[idx] += 1
                }
                let key = counter
                if hashMap[key] == nil { hashMap[key] = [String]() }
                hashMap[key]?.append(s)
            }
            return Array(hashMap.values)
        }

    //    func isAnagram(_ s: String, _ t: String) -> Bool {
    //        var count = [Int](repeating: 0, count: 26)
    //        let aCharUnicodeScalar = 97
    //        for scalar in s.unicodeScalars {
    //            count[Int(scalar.value) - aCharUnicodeScalar] += 1
    //        }
    //        for scalar in t.unicodeScalars {
    //            count[Int(scalar.value) - aCharUnicodeScalar] -= 1
    //        }
    //        guard count.first(where: {$0 != 0}) == nil else { return false }
    //        return true
    //    }
}
