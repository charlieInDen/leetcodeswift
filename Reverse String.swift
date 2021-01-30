//
//  Reverse String.swift
//  Leetcode
//
//  Created by Nishant on 25/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Write a function that reverses a string. The input string is given as an array of characters char[].
 
 Reference: https://leetcode.com/problems/reverse-string/
 */
func reverseString(_ s: inout [Character]) {
    var start = 0
    var end = s.count - 1
    while start < end {
        s.swapAt(start, end)
        start = start + 1
        end = end - 1
    }
}
