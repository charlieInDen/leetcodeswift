//
//  Reverse Words in a String.swift
//  Leetcode
//
//  Created by Nishant on 21/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an input string s, reverse the order of the words.
 
 Reference: https://leetcode.com/problems/reverse-words-in-a-string/
 */
func reverseWords(_ s: String) -> String {
    let components = s.components(separatedBy: " ")
    var res = ""
    for i in stride(from: components.count-1, to: -1, by: -1){
        if components[i].isEmpty {
            continue
        }
        res += components[i] + " "
    }
    return res.trimmingCharacters(in: .whitespaces)
}
