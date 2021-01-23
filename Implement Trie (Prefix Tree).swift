//
//  Implement Trie (Prefix Tree).swift
//  Leetcode
//
//  Created by Nishant on 22/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Implement a trie with insert, search, and startsWith methods.
 Reference: https://leetcode.com/problems/implement-trie-prefix-tree/
 */

class TrieNode {
    var children: [Character: TrieNode] = [Character: TrieNode]()
    var isEOW: Bool = false
}
class Trie {
    var root: TrieNode?
    /** Initialize your data structure here. */
    init() {
        root = TrieNode()
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var temp = word
        var start = root
        while temp.isEmpty == false {
            let c = temp.removeFirst()
            if start?.children[c] == nil {
                start?.children[c] = TrieNode()
            }
            start = start?.children[c]
        }
        start?.isEOW = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var temp = word
        var start = root
        while temp.isEmpty == false {
            guard let c = temp.first else { return false }
            if start?.children[c] != nil {
                temp.removeFirst()
                start = start?.children[c]
            } else {
                break
            }
        }
        if start?.isEOW == true && temp.isEmpty == true {
            return true
        }
        return false
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var temp = prefix
        var start = root
        while temp.isEmpty == false {
            guard let c = temp.first else { return false }
            if start?.children[c] != nil {
                temp.removeFirst()
                start = start?.children[c]
            } else {
                break
            }
        }
        if temp.isEmpty == true {
            return true
        }
        return false
    }
}
/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
