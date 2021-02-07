//
//  Add to Array-Form of Integer.swift
//  Leetcode
//
//  Created by Nishant on 02/02/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 For a non-negative integer X, the array-form of X is an array of its digits in left to right order.  For example, if X = 1231, then the array form is [1,2,3,1].

 Given the array-form A of a non-negative integer X, return the array-form of the integer X+K.
 
 Reference: https://leetcode.com/problems/add-to-array-form-of-integer/
 */
func addToArrayForm(_ A: [Int], _ K: Int) -> [Int] {
    var res = [Int](), carry = 0
    var i = A.count - 1, k = K
    while i >= 0 || k > 0 || carry > 0 {
        let valA = i >= 0 ? A[i] : 0
        let valB = k % 10
        let val = valA + valB + carry
        res.append(val % 10)
        carry = val / 10
        i -= 1
        k /= 10
    }
    
    
    return res.reversed()
}
