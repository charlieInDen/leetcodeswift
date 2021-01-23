//
//  Find Minimum in Rotated Sorted Array II.swift
//  Leetcode
//
//  Created by Nishant on 22/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

 (i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).

 Find the minimum element.
 
 Reference: https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/
 */
func findMin(_ nums: [Int]) -> Int {
    var low = 0
    var high = nums.count - 1
    while low < high {
        let mid = low + (high - low)/2
        if nums[mid] > nums[high] {
            low = mid + 1
        }else if nums[mid] < nums[high] {
            high = mid
        }else {
            high = high - 1
        }
    }
    return nums[low]
}
