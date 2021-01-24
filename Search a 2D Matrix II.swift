//
//  Search a 2D Matrix II.swift
//  Leetcode
//
//  Created by Nishant on 24/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Write an efficient algorithm that searches for a target value in an m x n integer matrix. The matrix has the following properties:

 Integers in each row are sorted in ascending from left to right.
 Integers in each column are sorted in ascending from top to bottom.
 
 Reference: https://leetcode.com/problems/search-a-2d-matrix-ii/
 */
func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    guard matrix.isEmpty == false else { return false}
    var row = matrix.count - 1
    var col = 0
    while row >= 0 && row < matrix.count && col >= 0 && col < matrix[0].count {
        if matrix[row][col] == target {
            return true
        } else if matrix[row][col] < target {
            col = col + 1
        } else {
            row = row - 1
        }
    }
    return false
}
