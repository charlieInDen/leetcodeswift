//
//  Arranging Coins.swift
//  Leetcode
//
//  Created by Nishant on 25/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 You have a total of n coins that you want to form in a staircase shape, where every k-th row must have exactly k coins.

 Given n, find the total number of full staircase rows that can be formed.

 n is a non-negative integer and fits within the range of a 32-bit signed integer.
 
 Reference: https://leetcode.com/problems/arranging-coins/
 */
func arrangeCoins(_ n: Int) -> Int {
    var start = 0
    var end = n
    var result = -1
    while start <= end {
        let mid = start + (end - start)/2
        if (mid*(mid+1))/2 == n {
            result = mid
            break
        }
        if (mid*(mid+1))/2 < n {
            start = mid + 1
            result = mid
        }else {
            end = mid - 1
        }
    }
    return result
}
