//
//  Longest Common Subsequence.swift
//  ProblemSolving_LeetCode
//
//  Created by Avneesh on 20/03/21.
//

import Foundation

class Solution {
    var result = Array(repeating: Array(repeating: -1, count: 1001), count: 1001)
    
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let text1Arr = Array(text1)
        let text2Arr = Array(text2)
        
        return lcsHelper(text1Arr, text2Arr, text1Arr.count, text2Arr.count)
    }
    
    private func lcsHelper(_ text1: [Character], _ text2: [Character], _ len1: Int, _ len2: Int) -> Int {
        
        if result[len1][len2] != -1 {
            return result[len1][len2]
        }
        
        if len1 == 0 || len2 == 0 {
            result[len1][len2] = 0
            return 0
        }
        
        if text1[len1 - 1] == text2[len2 - 1] {
            result[len1][len2] = 1 + lcsHelper(text1, text2, len1 - 1, len2 - 1)
            return result[len1][len2]
        }
        
        result[len1][len2] = max(lcsHelper(text1, text2, len1, len2 - 1), lcsHelper(text1, text2, len1 - 1, len2))
        return result[len1][len2]
        
    }
}
