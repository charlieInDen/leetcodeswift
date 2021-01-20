//
//  Spiral Matrix.swift
//  Leetcode
//
//  Created by Nishant on 20/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an m x n matrix, return all elements of the matrix in spiral order.
 
 Reference: https://leetcode.com/problems/spiral-matrix/
 */
func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    var result = [Int]()
    guard matrix.isEmpty == false else {
        return result
    }
    var c1 = 0
    var c2 = matrix[0].count - 1
    var r1 = 0
    var r2 = matrix.count - 1
    while c1 <= c2 && r1 <= r2 {
        for c in stride(from: c1, through: c2, by: 1) {
            result.append(matrix[r1][c])
        }
        for r in stride(from: r1 + 1, through: r2, by: 1){
            result.append(matrix[r][c2])
        }
        if r1 < r2 && c1 < c2 {
            for c in stride(from: c2 - 1, through: c1, by: -1) {
                result.append(matrix[r2][c])
            }
            for r in stride(from: r2 - 1, to: r1, by: -1) {
                result.append(matrix[r][c1])
            }
        }
        r1 = r1 + 1
        r2 = r2 - 1
        c1 = c1 + 1
        c2 = c2 - 1
    }
    return result
}
