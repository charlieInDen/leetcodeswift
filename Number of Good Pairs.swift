//
//  Number of Good Pairs.swift
//  ProblemSolving_LeetCode
//
//  Created by Avneesh on 11/04/21.
//

import Foundation

class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var map: [Int: Int] = [:]
        nums.forEach { (num) in
            if let number = map[num] {
                map[num] = number + 1
            } else {
                map[num] = 1
            }
        }
        
        var sum = 0
        
        for value in map.values {
            sum += value * (value - 1) / 2
        }
        
        return sum
    }
}
