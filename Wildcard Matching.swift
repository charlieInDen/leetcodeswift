//
//  Wildcard Matching.swift
//  Leetcode
//
//  Created by Nishant on 20/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an input string (s) and a pattern (p), implement wildcard pattern matching with support for '?' and '*' where:
 
 '?' Matches any single character.
 '*' Matches any sequence of characters (including the empty sequence).
 The matching should cover the entire input string (not partial).
 
 Reference: https://leetcode.com/problems/wildcard-matching/
 */
/// input string (s) and a pattern (p)
func isMatch(_ s: String, _ p: String) -> Bool {
    let sLen = s.count
    let pLen = p.count
    var sIdx = 0
    var pIdx = 0
    ///        Write down for a possible backtrack the star position in star_idx variable, and the current string pointer in s_tmp_idx variable.
    var starIdx = -1
    var sTempIdx = -1
    let sArr = Array(s)
    let pArr = Array(p)
    while sIdx < sLen {
        /// If the pattern character = string character or pattern character = '?'
        if pIdx < pLen && (sArr[sIdx] == pArr[pIdx] || pArr[pIdx] == "?") {
            sIdx = sIdx + 1
            pIdx = pIdx + 1
        }
        else if pIdx < pLen && pArr[pIdx] == "*" {
            /// Check the situation when '*' matches no characters(Backtrack scenario)
            starIdx = pIdx
            sTempIdx = sIdx
            pIdx = pIdx + 1
        }
            /// If pattern character != string character or pattern is used up and there was no '*' character in pattern
        else if starIdx == -1 {
            return false
        }
        else {
            /// If pattern character != string character or pattern is used up and there was '*' character in pattern before
            /// Backtrack: check the situation when '*' matches one more character
            pIdx = starIdx + 1
            sIdx = sTempIdx + 1
            sTempIdx = sIdx
        }
    }
    for i in pIdx..<pLen {
        if pArr[i] != "*" {
            return false
        }
    }
    return true
}
