//
//  Remove Duplicates from Sorted Array.swift
//  Leetcode
//
//  Created by Nishant on 20/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given a sorted array nums, remove the duplicates in-place such that each element appears only once and returns the new length.
 
 Reference: https://leetcode.com/problems/remove-duplicates-from-sorted-array/
 */
func removeDuplicates(_ nums: inout [Int]) -> Int {
    var i = 0
    var j = 1
    let len = nums.count
    if len == 0 { return 0 }
    while j < len {
        if nums[i] != nums[j] {
            nums.swapAt(i + 1, j)
            i = i + 1
        }
        j = j + 1
    }
    return i + 1
}
