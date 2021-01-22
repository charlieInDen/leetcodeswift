//
//  Single Number.swift
//  Leetcode
//
//  Created by Nishant on 21/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

 Follow up: Could you implement a solution with a linear runtime complexity and without using extra memory?
 
 Reference: https://leetcode.com/problems/single-number/
 */
func singleNumber(_ nums: [Int]) -> Int {
    var result = 0
    nums.forEach { (num) in
        result = result ^ num
    }
    return result
}
