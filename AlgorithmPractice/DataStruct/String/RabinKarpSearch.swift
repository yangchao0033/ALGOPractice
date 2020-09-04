//
// Created by 超杨 on 2020/8/25.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

struct RBConstant {
    static let hashMultiplier = 69069 // 如果是所有小写字母则用 26 即可
}

extension Character {
    var intValue: Int {
        let us = self.unicodeScalars
        return Int(us.first!.value)
    }
}

extension String {

    public static func search(text: String, pattern: String) -> Int {
        let patternArray: [Int] = pattern.map { $0.intValue }
        let textArray = text.map { $0.intValue }
        guard textArray.count >= patternArray.count else { return -1 }
        let patternHash = hashed(patternArray[...])
        var prevHash: Double = -1
        for idx in 0...textArray.count - patternArray.count {
            let endIdx = idx + patternArray.count - 1
            let window = textArray[idx...endIdx]
            var windowHash: Double = -1
            if prevHash == -1 {
                windowHash = hashed(window)
            } else {
                windowHash = nextHashed(
                        prevHash: prevHash,
                        dropped: textArray[idx - 1],
                        added: textArray[endIdx],
                        patternSize: patternArray.count)
            }
            if windowHash == patternHash &&
                       patternArray.elementsEqual(window) { // O(n)
                return idx
            }
            prevHash = windowHash
        }
        return -1

    }

    public static func hashed(_ array: ArraySlice<Int>) -> Double {
        var sum = 0 as Double
        var exponent = Double(array.count - 1)
        for item in array {
            sum += Double(item) * pow(Double(RBConstant.hashMultiplier), exponent)
            exponent -= 1
        }
        return sum
    }

    public static func nextHashed(prevHash: Double, dropped: Int, added: Int, patternSize: Int) -> Double {
        let oldHash = prevHash - (Double(dropped) * pow(Double(RBConstant.hashMultiplier), Double(patternSize - 1)))
        return oldHash * Double(RBConstant.hashMultiplier) + Double(added)
    }

    // 优化前
//    public static func search(text: String, pattern: String) -> Int {
    //        let patternArray: [Int] = pattern.map { $0.intValue }
//        let textArray = text.map { $0.intValue }
//        guard textArray.count >= patternArray.count else { return -1 }
//        // 查找第一组
//        let patternHash = hashed(patternArray[...])
//        let firstChars = textArray[0..<patternArray.count]
//        let firstHash = hashed(firstChars)
//        if patternHash == firstHash && patternArray == Array(firstChars) {
//            return 0
//        }
//        guard textArray.count > patternArray.count else { return -1 }
//        var prevHash = firstHash
//        for idx in 1...textArray.count - patternArray.count {
//            let endIdx = idx + patternArray.count - 1
//            let window = textArray[idx...endIdx]
//            let windowHash = nextHashed(
//                    prevHash: prevHash,
//                    dropped: textArray[idx - 1],
//                    added: textArray[endIdx],
//                    patternSize: patternArray.count)
//            if windowHash == patternHash &&
//                      patternArray == Array(window) {
//                return idx
//            }
//            prevHash = windowHash
//        }
//        return -1
//}
}
