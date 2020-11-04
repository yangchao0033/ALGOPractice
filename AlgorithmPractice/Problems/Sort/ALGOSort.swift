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
    /*
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
 */
    func bubbleSort(_ elements: [Int]) -> [Int] {
        guard elements.count > 1 else { return elements }
        var elements = elements
        for i in 0..<elements.count {
            var switchCheck = false
            for j in 0..<elements.count - i - 1 {
                if elements[j] > elements[j + 1] {
                    switchCheck = true
                    elements.swapAt(j, j + 1)
                }
                guard switchCheck else { break }
            }
        }
        return elements
    }
    /*
     插入排序
     */
    
    /*
    func insertSort<T: Comparable>(_ elements: [T]) -> [T] {
        guard elements.count > 1 else { return elements }
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
 */

    func insertSort(_ elements: [Int]) -> [Int] {
        guard elements.count > 1 else { return elements }
        var elements = elements
        for i in 1..<elements.count {
            var j = i
            let temp = elements[j]
            while j > 0 && temp < elements[j - 1] {
                elements[j] = elements[j - 1]
                j -= 1
            }
            elements[j] = temp
        }
        return elements
    }
    
    /*
     选择排序
     */
    
    /*
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
    }*/
    
    func selectionSort(_ elements: [Int]) -> [Int] {
        guard elements.count > 1 else { return elements }
        var a = elements
        for i in 0..<a.count {
            var lowest = i
            for j in i + 1..<a.count {
                if a[j] < a[lowest] {
                    lowest = j
                }
            }
            if i != lowest {
                a.swapAt(i, lowest)
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
        guard low < high else { return }
        let p = partitionHelper(&a, low: low, high: high)
        quickSort(&a, low: low, high: p - 1)
        quickSort(&a, low: p + 1, high: high)
    }
    
    private func partitionHelper<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
        let x = Int.random(in: low...high)
        a.swapAt(x, high)
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
     
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        var low = 0, high = nums.count - 1
        let target = nums.count - k
        while low < high {
            let index = partitionHelper(&nums, low, high)
            if index == target {
                return nums[index]
            } else if index < target {
                low = index + 1
            } else {
                high = index - 1
            }
        }
        return -1
    }
    
    private func partitionHelper(_ a: inout [Int], _ low: Int, _ high: Int) -> Int {
        let x = Int.random(in: low...high)
        a.swapAt(x, high)
        let pivot = a[high]
        var i = low
        for j in low..<high {
            if a[j] < pivot {
                a.swapAt(i, j)
                i += 1
            }
        }
        a.swapAt(i, high)
        return i
    }
    
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        if k == 0 || arr.count == 0 {
            return []
        }
        var arr = arr
        return quickSearch(&arr, 0, arr.count - 1, k - 1)
    }
    
    private func quickSearch(_ arr: inout [Int], _ low: Int, _ high: Int, _ target: Int) -> [Int] {
        let p = getPartition(&arr, low, high)
        if p == target {
            return [Int](arr[...p])
        }
        return p > target ?
        quickSearch(&arr, low, p - 1, target) :
        quickSearch(&arr, p + 1, high, target)
    }
    
    private func getPartition(_ arr: inout [Int], _ low: Int, _ high: Int) -> Int {
        let x = Int.random(in: low...high)
        arr.swapAt(x, high)
        let pivot = arr[high]
        var i = low
        for j in low..<high {
            if arr[j] < pivot {
                arr.swapAt(i, j)
                i += 1
            }
        }
        arr.swapAt(i, high)
        return i
    }
    
    func getBiggestNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        guard !arr.isEmpty && k != 0 else { return [] }
        var arr = arr
        return quickSearch2(&arr, 0, arr.count - 1, arr.count - k)
    }
    
    private func quickSearch2(_ nums: inout [Int], _ low: Int, _ high: Int, _ target: Int) -> [Int] {
        let p = parHelper(&nums, low, high)
        if p == target {
            return Array(nums[p...])
        }
        return p < target ? quickSearch2(&nums, p + 1, high, target) : quickSearch2(&nums, low, p - 1, target)
    }
    
    private func parHelper(_ nums: inout [Int], _ low: Int, _ high: Int) -> Int {
        let temp = Int.random(in: low...high)
        nums.swapAt(temp, low)
        let pivot = nums[low]
        var i = high
        var j = high
        while j > low {
            if nums[j] > pivot {
                nums.swapAt(j, i)
                i -= 1
            }
            j -= 1
        }
        nums.swapAt(i, low)
        return i
    }
}
