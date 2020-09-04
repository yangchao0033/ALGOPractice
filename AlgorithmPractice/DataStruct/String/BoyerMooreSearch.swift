//
//  File.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/8/26.
//  Copyright © 2020 superYang. All rights reserved.
//

import Foundation

extension String {
    
    func bfIndex(of pattern: String) -> Index? {
        let patternLength = pattern.count // 由于 String 不遵守 RadomAccess 协议，.count 时间复杂度为 O(n)，此处做一下缓存
        guard patternLength > 0 && patternLength <= self.count else { return nil }
        // 制作跳表
        var skipTable = [Character: Int]()
        for (i, c) in pattern.enumerated() {
            skipTable[c] = patternLength - i - 1
        }
        let p = pattern.index(before: pattern.endIndex)
        let lastChar = pattern[p]
        var i = index(startIndex, offsetBy: patternLength - 1)
        func backwards() -> Index? {
            var q = p
            var j = i
            while q > pattern.startIndex {
                q = pattern.index(before: q)
                j = index(before: j)
                guard self[j] == pattern[q] else { return nil }
            }
            return j
        }
        while i < endIndex {
            let c = self[i]
            if c == lastChar {
                if let res = backwards() { return res }
                let ofs = max(skipTable[c] ?? patternLength, 1)
                i = index(i, offsetBy: ofs, limitedBy: endIndex) ?? endIndex
            } else {
                i = index(i, offsetBy: skipTable[c] ?? patternLength, limitedBy: endIndex) ?? endIndex
            }
        }
        return nil
    }
}
