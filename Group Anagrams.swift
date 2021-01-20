//
//  Group Anagrams.swift
//  Leetcode
//
//  Created by Nishant on 20/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an array of strings strs, group the anagrams together. You can return the answer in any order.
 
 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
 
 Reference: https://leetcode.com/problems/group-anagrams/
 */
func groupAnagrams(_ strs: [String]) -> [[String]] {
    if strs.isEmpty { return [] }
    var count: [Int] = Array(repeating: 0, count: 26)
    var result: [String: [String]] = [String: [String]]()
    for word in strs {
        let letters = Array(word)
        count = Array(repeating: 0, count: 26)
        for character in letters {
            let index = Int(character.asciiValue! - Character("a").asciiValue! )
            count[index] = count[index] + 1
        }
        //Make key which will be same for all anagrams of that string
        var key = String()
        (0..<26).forEach { (index) in
            key.append(String(count[index]))
        }
        if let value = result[key] {
            var keyValue = value
            keyValue.append(word)
            result[key] = keyValue
        } else {
            result[key] = [word]
        }
    }
    let output: [[String]] = result.map { (key, value) -> [String] in
        return value
    }
    return output
}
