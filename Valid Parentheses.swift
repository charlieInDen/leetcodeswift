//
//  Valid Parentheses.swift
//  Leetcode
//
//  Created by Nishant on 20/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 An input string is valid if:
 
 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 
 Reference: https://leetcode.com/problems/valid-parentheses/
 */
func getPairs() -> [Character: Character] {
    var pair: [Character: Character] = [Character: Character]()
    pair["("] = ")"
    pair["["] = "]"
    pair["{"] = "}"
    return pair
}
func isValid(_ s: String) -> Bool {
    var result = true //empty case
    if s.isEmpty { return result }
    
    
    let letters = Array(s)
    let pair: [Character: Character] = getPairs()
    var stack: [Character] = []
    
    letters.forEach { (character) in
        if character == "(" || character == "[" || character == "{" {
            stack.append(character)
        } else {
            guard let top = stack.last else {
                result = false
                return
            }
            if pair[top] == character {
                _ = stack.removeLast()
            }else{
                result = false
                return
            }
        }
    }
    if stack.isEmpty == false { result = false }
    
    return result
    
}
