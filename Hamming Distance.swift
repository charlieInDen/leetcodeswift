//
//  Hamming Distance.swift
//  Leetcode
//
//  Created by Nishant on 26/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 The Hamming distance between two integers is the number of positions at which the corresponding bits are different.

 Given two integers x and y, calculate the Hamming distance.

 Note:
 0 ≤ x, y < 231.
 
 Reference: https://leetcode.com/problems/hamming-distance/
 */
func hammingDistance(_ x: Int, _ y: Int) -> Int {
    var count = 0
    var n = x ^ y
    
    while n > 0 {
        n &= n - 1
        count += 1
    }
    
    return count
}
