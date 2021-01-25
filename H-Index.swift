//
//  H-Index.swift
//  Leetcode
//
//  Created by Nishant on 25/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an array of citations (each citation is a non-negative integer) of a researcher, write a function to compute the researcher's h-index.

Reference: https://leetcode.com/problems/h-index/
 */

func hIndex(_ citations: [Int]) -> Int {
    let len = citations.count
    var papers: [Int] = Array(repeating: 0, count: len + 1)
    
    for c in citations {
        papers[min(len, c)] = papers[min(len, c)] + 1
    }
    var k = len
    var s = papers[len]
    while k > s {
        k = k - 1
        s = s + papers[k]
    }
    return k
}
