//
// Created by 超杨 on 2020/7/23.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

struct SequenceList<Element> {
    private var data: [Element]
    private var capacity = 0 // 数组长度
    private var count = 0 // 以保存的数据个数
    // 初始化
    init(defaultElement: Element, capacity: Int) {
        data = [Element](repeating: defaultElement, count: capacity)
        self.capacity = capacity
    }

    // 根据 index 查找元素
    func find(at index: Int) -> Element? {
        guard index >= 0, index < count else {
            return nil
        }
        return data[index]
    }

    // 插入
    mutating func insert(value: Element, at index: Int) -> Bool {
        guard index >= 0,
              index < count,
              count < capacity // 保证插入后不会索引越界
                else {
            return false
        }

        for i in (index...count - 1).reversed() {
            data[i + 1] = data[i]
        }

        data[index] = value
        count += 1
        return true
    }

    // 添加
    mutating func add(value: Element) -> Bool {
        guard count < capacity else { // 保证添加后不会索引越界
            return false
        }
        data[count] = value
        count += 1
        return true
    }

    // 删除
    mutating func delete(at index: Int) -> Bool {
        guard index >= 0, index < count else {
            return false
        }
        for i in (index..<count-1) {
            data[i] = data[i + 1]
        }
        count -= 1
        return true
    }

    // 清空
    mutating func clear() -> Bool {
        count = 0
        return true
    }

    // 判断顺序链表是否为空
    func isEmpty() -> Bool {
        return count == 0
    }

    // 遍历打印
    func printAll() {
        for i in 0..<count {
            print(data[i])
        }
        // 或者
//         print(data)
    }

    // 获取长度
    func length() -> Int {
        return count
    }

    func find(locate e: Element) -> Int {
        guard count > 0 else {
            return 0
        }

        var index = -1
        for i in 0..<count {
            if data[i] as AnyObject === e as AnyObject { // 抽象表达相等
                index = i
                break
            }
        }
        guard index != -1 else {
            return 0
        }

        return index
    }

}