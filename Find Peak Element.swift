//
//  Find Peak Element.swift
//  Leetcode
//
//  Created by Nishant on 22/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 A peak element is an element that is strictly greater than its neighbors.

 Given an integer array nums, find a peak element, and return its index. If the array contains multiple peaks, return the index to any of the peaks.

 You may imagine that nums[-1] = nums[n] = -∞.
 
 Reference: https://leetcode.com/problems/find-peak-element/
 */
func findPeakElement(_ nums: [Int]) -> Int {
     var left = 0
     var right = nums.count - 1
     while left < right {
        let middle = left + (right - left ) / 2
        if nums[middle] < nums[middle + 1] {
            left = middle + 1
        } else {
            right = middle
        }
     }
     return left
}
