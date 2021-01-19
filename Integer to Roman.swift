//
//  Integer to Roman.swift
//  Leetcode
//
//  Created by Nishant on 19/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an integer, convert it to a roman numeral.
 
 Reference: https://leetcode.com/problems/integer-to-roman/
 */
var values = [1000,900,500,400,100,90,50,40,10,9,5,4,1]
var symbols = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]

func intToRoman(_ num: Int) -> String {
    var ans = ""
    var number = num
    while number > 0 {
        var i = 0
        while values[i] > number {
            i = i + 1
        }
        ans = ans + symbols[i]
        number = number - values[i]
    }
    return ans
}
