//
//  Missing Number.swift
//  Leetcode
//
//  Created by Nishant on 24/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.

Reference: https://leetcode.com/problems/missing-number/
 */
func missingNumber(_ nums: [Int]) -> Int {
    let sum = nums.reduce(0, +)
    let n = nums.count
    let seriesSum = (n*(n+1))/2
    return seriesSum - sum
}
