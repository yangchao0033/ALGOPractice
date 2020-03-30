//
//  SortedArrayMerge.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/3/30.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class SortedArrayMerge {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: inout [Int], _ n: Int) {
            // 1. 暴力拼接排序
            nums1.replaceSubrange(m..<m + n, with: nums2)
            nums1.sort()
            // 2.尾部合并法
    //        var l1 = m - 1
    //        var l2 = n - 1
    //        var l = m + n - 1
    //        while l1 >= 0 && l2 >= 0 {
    //            if nums1[l1] > nums2[l2] {
    //                nums1[l] = nums1[l1]
    //                l1 -= 1
    //            } else {
    //                nums1[l] = nums2[l2]
    //                l2 -= 1
    //            }
    //            l -= 1
    //        }
    //        if l2 >= 0 {
    //            nums1.replaceSubrange(0..<l2 + 1, with: nums2[0..<l2 + 1])
    //        }
        }
}
