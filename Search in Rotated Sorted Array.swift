//
//  Search in Rotated Sorted Array.swift
//  Leetcode
//
//  Created by Nishant on 20/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 You are given an integer array nums sorted in ascending order (with distinct values), and an integer target.
 
 Suppose that nums is rotated at some pivot unknown to you beforehand (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
 
 If target is found in the array return its index, otherwise, return -1.
 
 Reference: https://leetcode.com/problems/search-in-rotated-sorted-array/
 */
func search(_ nums: [Int], _ target: Int) -> Int {
    var low = 0
    var high = nums.count - 1
    while low <= high {
        let mid = low + (high - low)/2
        if nums[mid] == target { return mid }
        if nums[low] <= nums[mid] {
            if target >= nums[low] && target < nums[mid] {
                high = mid - 1
            }else {
                low = mid + 1
            }
        } else {
            if target > nums[mid] && target <= nums[high] {
                low = mid + 1
            }else {
                high = mid - 1
            }
        }
    }
    return -1
}
