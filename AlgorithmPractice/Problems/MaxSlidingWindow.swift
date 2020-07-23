//
//  MaxSlidingWindow.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/4/1.
//  Copyright © 2020 superYang. All rights reserved.
//

import Cocoa

class MaxSlidingWindow: NSObject {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
            // 暴力法
    //        var left = 0
    //        var right = k - 1
    //        var res = [Int]()
    //        while right < nums.count {
    //            var maxNum = Int.min
    //            for i in left...right {
    //                maxNum = max(maxNum, nums[i])
    //            }
    //            res.append(maxNum)
    //            left += 1
    //            right += 1
    //        }
    //        return res
            // deque 双端队列法
            // 我们要保证最有潜力的元素索引留在 deque 中，并转换为需要的 output，所以要做 3 件事
            // a. 当 deque 中的索引超出 [i-(k-1), i]（k 区间内）时，及时从 deque 头部清理掉
            // b. 当 a(x) < a(i) 且 x < i 时，a[i] 即将进入 k 分组，所以 a[x] 是没有机会成为最大值的，所以将这样的索引从尾部去除
            // c.入队，并且在第一个 k 组遍历结束时，从 deque 头部获取到最大值的索引，并将对应的值添加到保存最大值的 res 数组中
            let n = nums.count
            var res = [Int]()
            var deque = Deque<Int>()
            for i in 0..<n {
                // a. 如果队列不空且超出 [i-(k-1), i] 区间，则从队头移除队列
                if !deque.isEmpty && deque.peekFront! < i - k + 1 {
                    _ = deque.dequeue()
                }
                // b. 当 a(x) < a(i) 且 x < i 时，a[i] 即将进入 k 分组，所以 a[x] 是没有机会成为最大值的，所以将这样的索引从尾部去除
                while !deque.isEmpty && nums[deque.peekBack!] < nums[i] {
                    _ = deque.dequeueBack()
                }
                // 入队
                deque.enqueue(i)
                if let peekFront = deque.peekFront {
                    // c.第一个 k 组遍历结束时，从 deque 头部获取到最大值的索引，并将对应的值添加到保存最大值的 res 数组中
                    if i >= k - 1 {
                        res.append(nums[peekFront])
                    }
                }
            }
            return res
        }
}
