//
//  Plus One.swift
//  ProblemSolving_LeetCode
//
//  Created by Avneesh on 14/03/21.
//

import Foundation
/*
 Given a non-empty array of decimal digits representing a non-negative integer, increment one to the integer.
 
 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contains a single digit.
 */

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        
        let arrSize = digits.count
        var result = digits
        var index = arrSize - 1
        if digits[index] == 9 {
            while (index >= 0 && digits[index] == 9) {
                result[index] = 0
                index -= 1
            }
            if index == -1 {
                result.insert(1, at: 0)
            } else {
                result[index] += 1
            }
            
        } else {
            result[index] += 1
        }
        
        return result
    }
}
