//
//  Maximum Subarray.swift
//  Leetcode
//
//  Created by Nishant on 20/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
 
 Reference: https://leetcode.com/problems/maximum-subarray/
 */
func maxSubArray(_ nums: [Int]) -> Int {
    if nums.isEmpty { return 0 }
    var sum = nums[0]
    var current = nums[0]
    for i in 1..<nums.count {
        current = max(current + nums[i], nums[i])
        sum = max(current, sum)
    }
    return sum
}
