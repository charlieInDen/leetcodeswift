//
//  Subsets.swift
//  ProblemSolving_LeetCode
//
//  Created by Avneesh on 12/04/21.
//

import Foundation

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        let arrSize = nums.count
        var result = [[Int]]()
        let subsetSize = Int(pow(Double(2), Double(arrSize)))
        
        for i in 0..<subsetSize {
            var temp: [Int] = []
            for j in 0..<arrSize {
                if i & Int(pow(Double(2), Double(j))) != 0 {
                    temp.append(nums[j])
                }
            }
            result.append(temp)
        }
        return result
    }
}
