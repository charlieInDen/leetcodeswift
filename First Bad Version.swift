//
//  First Bad Version.swift
//  Leetcode
//
//  Created by Nishant on 25/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation

/*
 You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.

 Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.

 You are given an API bool isBadVersion(version) which returns whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.
 
 Reference: https://leetcode.com/problems/first-bad-version/
 */
func firstBadVersion(_ n: Int) -> Int {
    var i = 1, j = n
    while i <= j {
        let h = i + (j-i)/2
        isBadVersion(h) ? (j = h-1) : (i = h + 1)
    }
    return i
}
