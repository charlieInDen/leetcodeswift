//
//  Power of Four.swift
//  Leetcode
//
//  Created by Nishant on 25/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an integer n, return true if it is a power of four. Otherwise, return false.

 An integer n is a power of four, if there exists an integer x such that n == 4x.
 
 Reference: https://leetcode.com/problems/power-of-four/
 */
func isPowerOfFour(_ num: Int) -> Bool {
    if num == 0 { return false }
    let n = num
    return n != 0 && ((n & (n-1)) == 0) && ((n & 0xAAAAAAAA) == 0)

}
