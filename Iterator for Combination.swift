//
//  Iterator for Combination.swift
//  Leetcode
//
//  Created by Nishant on 27/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Design the CombinationIterator class:

 CombinationIterator(string characters, int combinationLength) Initializes the object with a string characters of sorted distinct lowercase English letters and a number combinationLength as arguments.
 next() Returns the next combination of length combinationLength in lexicographical order.
 hasNext() Returns true if and only if there exists a next combination.
 
 Reference:https://leetcode.com/problems/iterator-for-combination/submissions/
 */
class CombinationIterator {
    let characters: [Character]
    let charCount: Int
    let lastIndex: Int
    var indices: [Int]
    
    init(_ characters: String, _ combinationLength: Int) {
        self.characters = Array(characters)
        charCount = characters.count
        lastIndex = combinationLength - 1
        indices = Array(0..<combinationLength)
        indices[lastIndex] -= 1 // little trick for next() and hasNext() to work
    }
    
    func next() -> String {
        // increment one index
        for i in stride(from: lastIndex, through: 0, by: -1) {
            if indices[i] == charCount - 1 - (lastIndex - i) { // last possible index
                if i == 0 { break }
                else { continue }
            } else {
                indices[i] += 1
                // move all indices, which are ahead, back
                let curIndex = indices[i]
                for j in i...lastIndex {
                    indices[j] = curIndex + j - i
                }
                break
            }
        }
        
        var result = ""
        for index in indices {
            result += String(characters[index])
        }
        
        return result
    }
    
    func hasNext() -> Bool {
        // return false the first index cannot be incremented any more
        return indices[0] != charCount - 1 - lastIndex
    }
}
