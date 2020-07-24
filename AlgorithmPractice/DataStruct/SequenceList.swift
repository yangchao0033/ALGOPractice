//
// Created by 超杨 on 2020/7/23.
// Copyright (c) 2020 superYang. All rights reserved.
//

import Foundation

struct SequenceList<Element> {
    private var data: [Element]
    /// 存储容量
    private var capacity = 0
    /// 元素个数
    private var count = 0
    
    /// 顺序表初始化
    /// - Parameters:
    ///   - defaultElement: 默认元素
    ///   - capacity: 存储容量
    init(defaultElement: Element, capacity: Int) {
        data = [Element](repeating: defaultElement, count: capacity)
        self.capacity = capacity
    }
    
    /// 根据 index 查找元素
    /// - Parameter index: index 索引
    /// - Returns: 查找到的元素，如无法找到返回 nil
    func find(at index: Int) -> Element? {
        guard index >= 0, index < count else {
            return nil
        }
        return data[index]
    }
    
    /// 根据元素查找对应的 index 索引
    /// - Parameter e: 要查找的元素
    /// - Returns: 返回元素存储的索引位置
    func find(locate e: Element) -> Int {
        guard count > 0 else {
            return 0
        }
        var index = -1
        for i in 0..<count where data[i] as AnyObject === e as AnyObject { // 简单模拟元素相等
            index = i
            break
        }
        guard index != -1 else {
            return 0
        }
        
        return index
    }
    
    /// 插入元素到指定索引位置
    /// - Parameters:
    ///   - value: 要插入的元素
    ///   - index: 期望插入的索引位置
    /// - Returns: 插入是否成功
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
    
    /// 添加元素到表末尾
    /// - Parameter value: 要添加的元素
    /// - Returns: 返回成功状态
    mutating func add(value: Element) -> Bool {
        guard count < capacity else { // 保证添加后不会索引越界
            return false
        }
        data[count] = value
        count += 1
        
        return true
    }
    
    /// 删除指定位置的元素
    /// - Parameter index: 位置索引
    /// - Returns: 删除是否成功的状态
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
    
    /// 清空顺序表
    /// - Returns: 返回清空状态
    mutating func clear() -> Bool {
        count = 0
        return true
    }
    
    /// 判断链表是否为空
    func isEmpty() -> Bool {
        return count == 0
    }
    
    /// 遍历打印顺序表
    func printAll() {
        for i in 0..<count {
            print(data[i])
        }
        // 或者
        //         print(data)
    }
    
    /// 获取顺序表长度
    func length() -> Int {
        return count
    }
    
}
