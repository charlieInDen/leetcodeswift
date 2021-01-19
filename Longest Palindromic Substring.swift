//
//  Longest Palindromic Substring.swift
//  Leetcode
//
//  Created by Nishant on 19/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given a string s, return the longest palindromic substring in s.
 Reference: https://leetcode.com/problems/longest-palindromic-substring/
 */
func isPalindrome(s: [Character], l: Int, r: Int) -> Int {
    var left = l
    var right = r
    //expand around these left and right to find out the max size palindrome
    while left >= 0 && right < s.count && s[left] == s[right] {
        left = left - 1 // expand toward left direction
        right = right + 1 // expand toward right direction
    }
    return right - left - 1
}
func longestPalindrome(_ s: String) -> String {
    if s.isEmpty { return "" }
    let letters = Array(s)
    var start = 0
    var end = 0
    for index in 0..<letters.count {
        //Check for odd and even size string -
        //for ODD - centre will be one index only but for EVEN - centre will be two index and index + 1
        let evenLength = isPalindrome(s: letters, l: index, r: index + 1)
        let oddLength = isPalindrome(s: letters, l: index, r: index)
        let maxLength = max(evenLength, oddLength)
        print(maxLength, index)
        if maxLength > end - start {
            start = index - (maxLength - 1)/2
            end = index + maxLength/2
        }
    }
    print(start,end)
    let startIndex = s.index(s.startIndex, offsetBy: start)
    let endIndex = s.index(s.startIndex, offsetBy: end)
    return String(s[startIndex...endIndex])
}
