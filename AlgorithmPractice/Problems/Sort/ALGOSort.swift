//
//  BubbleSort.swift
//  AlgorithmPractice
//
//  Created by 超杨 on 2020/9/14.
//  Copyright © 2020 superYang. All rights reserved.
//

import Foundation

class ALGOSort {
    /* 冒泡排序 */
    public func bubbleSort<T: Comparable>(_ elements: [T]) -> [T] {
        guard elements.count > 1 else { return elements }
        var array = elements
        for i in 0..<array.count {
            var switchCheck = false
            for j in 0..<array.count-i-1 {
                if array[j] > array[j + 1] {
                    switchCheck = true
                    array.swapAt(j, j + 1)
                }
            }
            if !switchCheck {
                break
            }
        }
        return array
    }
    /*
     插入排序
     */
    func insertSort<T: Comparable>(_ elements: [T]) -> [T] {
        guard elements.count > 1 else {
            return elements
        }
        var array = elements
        for i in 1..<array.count {
            var j = i
            let temp = array[j]
            while j > 0 && temp < array[j - 1] {
                array[j] = array[j - 1]
                j -= 1
            }
            array[j] = temp
        }
        return array
    }
    /*
     选择排序
     */
    func selectionSort<T: Comparable>(_ elements: [T]) -> [T] {
        guard elements.count > 1 else { return elements }
        var a = elements
        for x in 0..<a.count {
            var lowest = x
            for y in x+1..<a.count {
                if a[y] < a[lowest] {
                    lowest = y
                }
            }
            if x != lowest {
                a.swapAt(x, lowest)
            }
        }
        return a
    }
    
    /*
     归并排序
     */
    func mergeSort<T: Comparable>(_ elements: [T]) -> [T] {
        guard elements.count > 1 else { return elements }
        let midIndex = elements.count / 2
        let leftArray = mergeSort(Array(elements[..<midIndex]))
        let rightArray = mergeSort(Array(elements[midIndex...]))
        return mergeHelper(leftPlie: leftArray, rightPlie: rightArray)
    }
    private func mergeHelper<T: Comparable>(leftPlie: [T], rightPlie: [T]) -> [T] {
        var leftIndex = 0
        var rightIndex = 0
        var orderedPile = [T]()
        if orderedPile.capacity < leftPlie.count + rightPlie.count {
            orderedPile.reserveCapacity(leftPlie.count + rightPlie.count) // 申请空间，避免多次动态扩容
        }
        while true {
            guard leftIndex < leftPlie.count else {
                orderedPile.append(contentsOf: rightPlie[rightIndex...])
                break
            }
            guard rightIndex < rightPlie.count else {
                orderedPile.append(contentsOf: leftPlie[leftIndex...])
                break
            }
            
            if leftPlie[leftIndex] < rightPlie[rightIndex] {
         
                orderedPile.append(leftPlie[leftIndex])
                leftIndex += 1
            } else {
                orderedPile.append(rightPlie[rightIndex])
                rightIndex += 1
            }
        }
        return orderedPile
    }
    
    /*
     快速排序
     */
    func quickSort<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
        guard a.count > 1 else { return }
        guard low < high else { return }
        let p = partitionHelper(&a, low: low, high: high)
        quickSort(&a, low: low, high: p - 1)
        quickSort(&a, low: p + 1, high: high)
    }
    
    private func partitionHelper<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
        let pivot = a[high]
        
        var i = low
        for j in low..<high {
            if a[j] <= pivot {
                a.swapAt(i, j)
                i += 1
            }
        }
        a.swapAt(i, high)
        return i
    }
}
