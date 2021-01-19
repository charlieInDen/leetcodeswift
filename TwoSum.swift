//
//  TwoSum.swift
//  Leetcode
//
//  Created by Nishant on 19/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
 
 Reference: https://leetcode.com/problems/two-sum/
 */
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map: [Int:  Int] = [:]
    for (index, no) in nums.enumerated() {
        let other = target - no
        if let i = map[other] {
            return [i, index]
        }
        map[no] = index
    }
    return []
}
