//
//  Sliding Window Maximum.swift
//  Leetcode
//
//  Created by Nishant on 24/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*You are given an array of integers nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.
 
 Return the max sliding window.
 
 Reference: https://leetcode.com/problems/sliding-window-maximum/
 */
var deque: [Int] = []
var nums: [Int]! = []

func cleanDeque(_ i: Int, _ k: Int) {
    if deque.isEmpty == false{
        if let first = deque.first, first == i - k {
            deque.removeFirst()
        }
    }
    
    while deque.isEmpty == false {
        if let last = deque.last, nums[i] > nums[last] {
            deque.removeLast()
        }else {
            break
        }
    }
    
}

func maxSlidingWindow(_ numsa: [Int], _ k: Int) -> [Int] {
    nums = numsa
    let len = nums.count
    if len * k == 0 { return [] }
    if k == 1 { return nums }
    
    var maxId = 0
    for i in 0..<k {
        cleanDeque(i, k)
        deque.append(i)
        if nums[i] > nums[maxId] { maxId = i }
    }
    var output: [Int] = []
    output.append(nums[maxId])
    for i in k..<len {
        cleanDeque(i, k)
        deque.append(i)
        if let first = deque.first {
            output.append(nums[first])
        }
    }
    return output
}
