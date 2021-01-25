//
//  Fizz Buzz.swift
//  Leetcode
//
//  Created by Nishant on 25/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Write a program that outputs the string representation of numbers from 1 to n.
 
 Reference: https://leetcode.com/problems/fizz-buzz/
 */
func fizzBuzz(_ n: Int) -> [String] {
    var array = [String]()
    
    for i in 1...n {
        if i % 3 == 0 && i % 5 == 0 {
            array.append("FizzBuzz")
        } else if i % 3 == 0 {
            array.append("Fizz")
        } else if i % 5 == 0 {
            array.append("Buzz")
        } else {
            array.append("\(i)")
        }
    }
    
    return array
}
