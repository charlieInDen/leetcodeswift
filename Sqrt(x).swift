//
//  Sqrt(x).swift
//  Leetcode
//
//  Created by Nishant on 20/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given a non-negative integer x, compute and return the square root of x.
 
 Since the return type is an integer, the decimal digits are truncated, and only the integer part of the result is returned.
 
 Reference: https://leetcode.com/problems/sqrtx/
 */
func mySqrt(_ x: Int) -> Int {
    guard x != 0 else { return 0 }
    guard x > 3 else { return 1 }
    
    var low = 2
    var high = x / 2
    
    while low <= high {
        let middle = (low + high) / 2
        
        if middle == x / middle  {
            return middle
        } else if middle * middle < x {
            low = middle + 1
        } else {
            high = middle - 1
        }
    }
    
    return high
}
