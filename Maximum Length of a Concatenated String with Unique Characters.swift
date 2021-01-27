//
//  Maximum Length of a Concatenated String with Unique Characters.swift
//  Leetcode
//
//  Created by Nishant on 27/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an array of strings arr. String s is a concatenation of a sub-sequence of arr which have unique characters.
 
 Return the maximum possible length of s.
 
 Reference: https://leetcode.com/problems/maximum-length-of-a-concatenated-string-with-unique-characters/
 */
func maxLength(_ arr: [String]) -> Int {
    var result = 0
    // Prepare the table that holds the unique formed strings at arr[i]
    var tab: [[String]] = Array(repeating: [], count: arr.count)
    for i in 0 ..< arr.count {
        var solutions = tab[i]
        /// Consider arr[i] as possible unique formed string
        solutions.append(arr[i])
        /// Loop through the solutions at arr[i
        for current in solutions {
            /// Current can be longest too. So check it
            if formsUnique(current, "") {
                result = Swift.max(result, current.count)
            }
            for j in i + 1 ..< arr.count {
                let candidate = arr[j]
                if formsUnique(current, candidate) {
                    let new = current + candidate
                    result = Swift.max(result, new.count)
                    /// Add the unique formed string at arr[i]
                    tab[j].append(new)
                }
            }
        }
    }
    return result
}

func formsUnique(_ left: String, _ right: String) -> Bool {
    let set = Set(left + right)
    return set.count == (left + right).count
}
