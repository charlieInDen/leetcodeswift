//
//  Longest Substring Without Repeating Characters.swift
//  Leetcode
//
//  Created by Nishant on 19/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given a string s, find the length of the longest substring without repeating characters.
 
 Reference: https://leetcode.com/problems/longest-substring-without-repeating-characters/
 */
func lengthOfLongestSubstring(_ s: String) -> Int {
    let length = s.count
    var ans = 0
    var start = 0
    var current = 0
    var charMap: [Character: Int] = [:]
    let letters = Array(s)
    while current < length {
        if charMap[letters[current]] == nil {
            charMap[letters[current]] = current
            current = current + 1
            ans = max(ans, current - start)
        } else {
            charMap.removeValue(forKey: letters[start])
            start = start + 1
        }
    }
    return ans
}
