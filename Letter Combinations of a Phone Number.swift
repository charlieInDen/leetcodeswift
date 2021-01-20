//
//  Letter Combinations of a Phone Number.swift
//  Leetcode
//
//  Created by Nishant on 20/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.
 Reference: https://leetcode.com/problems/letter-combinations-of-a-phone-number/
 */
var hashMap: [String: String] = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
func generateCombination(result: String, nextDigit: String, output: inout [String]) {
    if nextDigit.isEmpty {
        output.append(result)
        return
    }else {
        var newDigit = nextDigit
        let firstString = newDigit.removeFirst()
        if let value = hashMap[String(firstString)] {
            let letters = Array(value)
            for letter in letters {
                generateCombination(result: result + String(letter), nextDigit: newDigit, output: &output)
            }
        }
    }
}
func letterCombinations(_ digits: String) -> [String] {
    var output: [String] = []
    if digits.isEmpty == false {
        generateCombination(result: "", nextDigit: digits, output: &output)
    }
    return output
}
