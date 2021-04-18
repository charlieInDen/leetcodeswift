//
//  Pascal's Triangle.swift
//  ProblemSolving_LeetCode
//
//  Created by Avneesh on 18/04/21.
//

import Foundation

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        result.append([1])
        
        var prevArr: [Int] = []
        
        for row in 1..<numRows {
            prevArr = result[row - 1]
            var arr = Array<Int>(repeating: 0, count: row + 1)
            arr[0] = 1
            arr[row] = 1
            for col in 1..<row {
                arr[col] = prevArr[col - 1] + prevArr[col]
            }
            result.append(arr)
        }
        return result
    }
}
