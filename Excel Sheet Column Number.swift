//
//  Excel Sheet Column Number.swift
//  Leetcode
//
//  Created by Nishant on 22/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given a column title as appear in an Excel sheet, return its corresponding column number.

Reference: https://leetcode.com/problems/excel-sheet-column-number/
 */
func titleToNumber(_ s: String) -> Int {
    let letters = Array(s)
    var result = 0
    let count = letters.count
    for i in 0..<count {
        result = result * 26
        result = result + Int(letters[i].asciiValue!) - Int(Character("A").asciiValue!) + 1
    }
    return result
}
