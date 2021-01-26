//
//  Design HashSet.swift
//  Leetcode
//
//  Created by Nishant on 26/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Design a HashSet without using any built-in hash table libraries.

 To be specific, your design should include these functions:

 add(value): Insert a value into the HashSet.
 contains(value) : Return whether the value exists in the HashSet or not.
 remove(value): Remove a value in the HashSet. If the value does not exist in the HashSet, do nothing.
 
 Reference:https://leetcode.com/problems/design-hashset/
 */
class MyHashSet {
    func add(_ key: Int) {
        guard !contains(key) else { return }
        let hashValue = hash(key: key)
        array[hashValue].append(key)
    }
    
    func remove(_ key: Int) {
        guard contains(key) else { return }
        let hashValue = hash(key: key)
        array[hashValue].removeAll { (val) -> Bool in
            val == key
        }
    }
    
    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        let hashValue = hash(key: key)
        let first = array[hashValue].first { (val) -> Bool in
            val == key
        }
        return first != nil
    }
    
    // MARK: Private
    
    private static let kBuckets = 1000
    
    private var array = [[Int]](repeating: [Int](), count: MyHashSet.kBuckets)
    
    private func hash(key: Int) -> Int {
        return key % MyHashSet.kBuckets
    }
}
