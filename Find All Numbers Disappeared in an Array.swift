//
//  Find All Numbers Disappeared in an Array.swift
//  Leetcode
//
//  Created by Nishant on 26/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
 
 Find all the elements of [1, n] inclusive that do not appear in this array.
 
 Reference: https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/
 */
func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    var numbers = nums
    var result: [Int] = []
    for i in 0..<nums.count {
        let index = abs(numbers[i]) - 1
        if numbers[index] > 0 {
            numbers[index] = -1 * numbers[index]
        }
    }
    for i in stride(from: nums.count, through: 1, by: -1) {
        if numbers[i - 1] >= 0 {
            result.append(i)
        }
    }
    return result
}
