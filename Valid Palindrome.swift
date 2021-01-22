//
//  Valid Palindrome.swift
//  Leetcode
//
//  Created by Nishant on 21/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
 
 Reference: https://leetcode.com/problems/valid-palindrome/
 */
func isPalindrome(_ s: String) -> Bool {
    guard s != "" else { return true }
    let str = s.lowercased()
    let arr = Array(str.filter { $0.isLetter || $0.isNumber })
    
    for i in 0..<(arr.count / 2) {
        if arr[i] != arr[arr.count - 1 - i] {
            return false
        }
    }
    
    return true
}
