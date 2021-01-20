//
//  Search in Rotated Sorted Array II.swift
//  Leetcode
//
//  Created by Nishant on 20/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 You are given an integer array nums sorted in ascending order (not necessarily distinct values), and an integer target.
 
 Suppose that nums is rotated at some pivot unknown to you beforehand (i.e., [0,1,2,4,4,4,5,6,6,7] might become [4,5,6,6,7,0,1,2,4,4]).
 
 If target is found in the array return its index, otherwise, return -1.
 
 Reference: https://leetcode.com/problems/search-in-rotated-sorted-array-ii/
 */
func search(_ nums: [Int], _ target: Int) -> Bool {
    if nums.count == 0 {
        return false
    }
    
    var left = 0
    var right = nums.count - 1
    var middle = 0
    
    while left < right {
        middle = (left + right) / 2
        if nums[middle] == target {
            return true
        }
        if nums[middle] > nums[right] {
            if nums[middle] > target && nums[left] <= target {
                right = middle
            } else {
                left = middle + 1
            }
        } else if nums[middle] < nums[right] {
            if nums[middle] < target && nums[right] >= target {
                left = middle + 1
            } else {
                right = middle
            }
        } else {
            right -= 1
        }
    }
    
    return nums[left] == target ? true : false
}
