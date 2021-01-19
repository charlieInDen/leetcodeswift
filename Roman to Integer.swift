//
//  Roman to Integer.swift
//  Leetcode
//
//  Created by Nishant on 19/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given a roman numeral, convert it to an integer.
 
 Reference: https://leetcode.com/problems/roman-to-integer/
 */

var romanIntMap = ["M": 1000,"CM": 900,"D": 500,"CD": 400,"C": 100,"XC": 90,"L": 50,"XL": 40,"X": 10,"IX": 9,"V": 5,"IV": 4,"I": 1]

func romanToInt(_ s: String) -> Int {
    let letters = Array(s)
    var i = 0
    var result = 0
    while i < letters.count {
        if i < letters.count - 1 {
            //Take two letters
            let str = String(letters[i]) + String(letters[i + 1])
            if let value = romanIntMap[str] {
                result = result + value
                i = i + 2
            }else if let value = romanIntMap[String(letters[i])] {
                result = result + value
                i = i + 1
            }
        }else {
            if let value = romanIntMap[String(letters[i])] {
                result = result + value
                i = i + 1
            }
        }
    }
    return result
}
