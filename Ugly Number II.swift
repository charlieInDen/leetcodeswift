//
//  Ugly Number II.swift
//  Leetcode
//
//  Created by Nishant on 24/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Write a program to find the n-th ugly number.
 
 Ugly numbers are positive numbers whose prime factors only include 2, 3, 5.
 
 Reference: https://leetcode.com/problems/ugly-number-ii/
 */
var u2: Int = 2
var u3: Int = 3
var u5: Int = 5
/// returns smallest
var i2: Int = 0
var i3: Int = 0
var i5: Int = 0
func min(_ first: Int,_ second: Int,_ third: Int) -> Int {
    return min(min(first, second), third)
}

func nthUglyNumber(_ n: Int) -> Int {
    var uglyNums = [1]
    for _ in 1..<n {
        let result = min(u2,u3,u5)
        uglyNums.append(result)
        if result == u2 {
            i2 = i2 + 1
            u2 = uglyNums[i2]*2
        } // 4
        if result == u3 {
            i3 = i3 + 1
            u3 = uglyNums[i3]*3
        }
        if result == u5 {
            i5 = i5 + 1
            u5 = uglyNums[i5]*5
            
        }
    }
    print(uglyNums)
    return uglyNums[n-1]
}
