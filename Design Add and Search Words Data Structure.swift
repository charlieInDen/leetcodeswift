//
//  Design Add and Search Words Data Structure.swift
//  Leetcode
//
//  Created by Nishant on 24/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Design a data structure that supports adding new words and finding if a string matches any previously added string.
 
 Implement the WordDictionary class:
 
 WordDictionary() Initializes the object.
 void addWord(word) Adds word to the data structure, it can be matched later.
 bool search(word) Returns true if there is any string in the data structure that matches word or false otherwise. word may contain dots '.' where dots can be matched with any letter.
 
 Reference: https://leetcode.com/problems/design-add-and-search-words-data-structure/
 */
class TrieNode {
    var children: [TrieNode?]
    var isEndOfWord: Bool
    init() {
        children = Array(repeating: nil, count: 26)
        isEndOfWord = false
    }
}
class WordDictionary {
    private var rootNode: TrieNode
    private let asciiValueOfz: UInt8 = Character("z").asciiValue!
    /** Initialize your data structure here. */
    init() {
        rootNode = TrieNode()
    }
    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
        var trieNode: TrieNode = rootNode
        for (wordIndex, char) in word.enumerated() {
            if let charAscii: UInt8 = char.asciiValue {
                let index: Int = 25 - Int(asciiValueOfz - charAscii)
                if let child = trieNode.children[index] {
                    trieNode = child
                } else {
                    trieNode.children[index] = TrieNode()
                    trieNode = trieNode.children[index]!
                }
                if wordIndex == word.count - 1 {
                    trieNode.isEndOfWord = true
                }
            }
        }
    }
    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    func search(_ word: String) -> Bool {
        return search(word, root: rootNode)
    }
    func search(_ word: String, root: TrieNode) -> Bool {
        var trieNode: TrieNode = root
        for (wordIndex, char) in word.enumerated() {
            if char == Character(".") {
                //search in all children
                var exist: Bool = false
                trieNode.children.forEach { (trieChildNode) in
                    if let trieChildNode = trieChildNode {
                        let fromIndex: String.Index = word.index(word.startIndex, offsetBy: wordIndex+1)
                        let subStr: String = String(word[fromIndex...])
                        if subStr.isEmpty {
                            if trieChildNode.isEndOfWord {
                                exist = true
                            }
                        } else {
                            if search(subStr, root: trieChildNode) {
                                exist = true
                            }
                        }
                    }
                }
                return exist
            }
            if let charAscii: UInt8 = char.asciiValue {
                let index: Int = 25 - Int(asciiValueOfz - charAscii)
                if let child = trieNode.children[index] {
                    trieNode = child
                } else {
                    trieNode.children[index] = TrieNode()
                    trieNode = trieNode.children[index]!
                }
                if wordIndex == word.count - 1 {
                    return trieNode.isEndOfWord == true
                }
            }
        }
        return false
    }
}
