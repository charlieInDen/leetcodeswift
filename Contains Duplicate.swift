//
//  Contains Duplicate.swift
//  Leetcode
//
//  Created by Nishant on 24/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an array of integers, find if the array contains any duplicates.
 
 Reference: https://leetcode.com/problems/contains-duplicate/
 */
func containsDuplicate(_ nums: [Int]) -> Bool {
    if nums.count == 0 || nums.count == 1 {
        return false
    }
    let result = Set(nums)
    if result.count != nums.count {
        return true
    }
    return false
}
