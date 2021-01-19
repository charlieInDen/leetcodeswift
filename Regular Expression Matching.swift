//
//  Regular Expression Matching.swift
//  Leetcode
//
//  Created by Nishant on 19/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an input string (s) and a pattern (p), implement regular expression matching with support for '.' and '*' where:

 '.' Matches any single character.
 '*' Matches zero or more of the preceding element.
 The matching should cover the entire input string (not partial).
 
 Reference: https://leetcode.com/problems/regular-expression-matching/
 */
func traverse( _ text: [Character], _ pattern: [Character]) -> Bool {
    // Base condition
    let tLen = text.count
    let pLen = pattern.count
    var visited:[[Bool]] = [[Bool]]()
    for _ in 0...tLen + 1 {
        visited.append(Array(repeating: false, count: pLen + 1))
    }
    visited[tLen][pLen] = true
    for i in stride(from: tLen, through: 0, by: -1) {
        for j in stride(from: pLen - 1, through: 0, by: -1) {
            let isFirstMatch = i < tLen && (text[i] == pattern[j] || pattern[j] == ".")
            if j + 1 < pLen && pattern[j + 1] == "*" {
                visited[i][j] = visited[i][j+2] || isFirstMatch && visited[i + 1][j]
            } else {
                visited[i][j] = isFirstMatch && visited[i + 1][j + 1]
            }
        }
    }
    return visited[0][0]
    
}
//'.' Matches any single character.
//'*' Matches zero or more of the preceding element.
func isMatch(_ s: String, _ p: String) -> Bool {
    return traverse(Array(s), Array(p))
}
