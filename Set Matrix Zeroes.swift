//
//  Set Matrix Zeroes.swift
//  Leetcode
//
//  Created by Nishant on 20/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an m x n matrix. If an element is 0, set its entire row and column to 0. Do it in-place.

 Follow up:

 A straight forward solution using O(mn) space is probably a bad idea.
 A simple improvement uses O(m + n) space, but still not the best solution.
 Could you devise a constant space solution?
 
 Reference: https://leetcode.com/problems/set-matrix-zeroes/
 */

func setZeroes(_ matrix: inout [[Int]]) {
    let nRow = matrix.count
    let nCol = matrix[0].count
    var hasZeroFirstColumn = false
    for i in 0..<nRow {
        if matrix[i][0] == 0 {
            hasZeroFirstColumn = true
            break
        }
    }
    var hasZeroFirstRow = false
    for i in 0..<nCol {
        if matrix[0][i] == 0 {
            hasZeroFirstRow = true
            break
        }
    }
    for i in 0..<nRow {
        for j in 0..<nCol {
            if i != 0 && j != 0 && matrix[i][j] == 0 {
                matrix[0][j] = 0
                matrix[i][0] = 0
            }
        }
    }
    for i in 0..<nRow {
        for j in 0..<nCol {
            if i != 0 && j != 0 && (matrix[i][0] == 0 || matrix[0][j] == 0) {
                matrix[i][j] = 0
            }
        }
    }
    if hasZeroFirstColumn {
        for i in 0..<nRow {
            matrix[i][0] = 0
        }
    }
    if hasZeroFirstRow {
        for j in 0..<nCol {
            matrix[0][j] = 0
        }
    }
    
}
