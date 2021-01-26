//
//  Squares of a Sorted Array.swift
//  Leetcode
//
//  Created by Nishant on 26/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.
 
 Reference: https://leetcode.com/problems/squares-of-a-sorted-array/
 */
func sortedSquares(_ A: [Int]) -> [Int] {
    var res = [Int](repeating: 0, count: A.count)
    var index = A.count - 1
    var left = 0
    var right = A.count - 1
    while left <= right {
        let a = A[left] * A[left]
        let b = A[right] * A[right]
        if a > b {
            res[index] = a
            index -= 1
            left += 1
        } else {
            res[index] = b
            index -= 1
            right -= 1
        }
    }
    return res
}
