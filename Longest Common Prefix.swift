//
//  Longest Common Prefix.swift
//  Leetcode
//
//  Created by Nishant on 20/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Write a function to find the longest common prefix string amongst an array of strings.
 
 Reference: https://leetcode.com/problems/longest-common-prefix/
 */
class Trie {
    var child: [Character: Trie] = [:]
    var isEOW = false
    var count: Int = 0
}
var trie = Trie()
func insertWord(_ word: String) {
    var i = 0
    let letters = Array(word)
    let length = letters.count
    var trieNode = trie
    while i < length {
        if trieNode.child[letters[i]] == nil {
            trieNode.child[letters[i]] = Trie()
        }
        trieNode.child[letters[i]]!.count = trieNode.child[letters[i]]!.count + 1
        trieNode = trieNode.child[letters[i]]!
        i = i + 1
    }
    trieNode.isEOW = true
}
func getPrefix(_ word: String,_ count: Int) -> String {
    var i = 0
    let letters = Array(word)
    let length = letters.count
    var trieNode = trie
    var result = ""
    while i < length {
        if trieNode.child[letters[i]] != nil &&  count == trieNode.child[letters[i]]!.count {
            trieNode = trieNode.child[letters[i]]!
            result = result + String(letters[i])
            
        } else{
            break
        }
        i = i + 1
    }
    return result
}
func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.isEmpty { return "" }
    strs.forEach { (word) in
        insertWord(word)
    }
    
    return getPrefix(strs[0], strs.count)
}
