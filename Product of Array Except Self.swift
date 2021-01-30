//
//  Product of Array Except Self.swift
//  Leetcode
//
//  Created by Nishant on 24/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].

Reference: https://leetcode.com/problems/product-of-array-except-self/
 */
func productExceptSelf(_ nums: [Int]) -> [Int] {
    var output: [Int] = Array(repeating: 1, count: nums.count)
    var multi = 1
    for i in 1..<nums.count {
        multi = nums[i-1]*multi
        output[i] = multi
    }
    multi = 1
    for i in stride(from: nums.count - 2, through: 0, by: -1) {
        multi = nums[i+1]*multi
        output[i] = output[i]*multi
    }
    return output
}
