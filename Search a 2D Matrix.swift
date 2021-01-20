//
//  Search a 2D Matrix.swift
//  Leetcode
//
//  Created by Nishant on 20/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
 
 Integers in each row are sorted from left to right.
 The first integer of each row is greater than the last integer of the previous row.
 
 Reference: https://leetcode.com/problems/search-a-2d-matrix/
 */
func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    var result = false
    for row in matrix {
        var last = row.count - 1
        if last < 0 { break }
        if row[last] == target {
            result = true
            break
        }else if row[last] > target {
            while last >= 0 {
                if row[last] == target {
                    result = true
                    break
                }
                last = last - 1
            }
        } else {
            continue
        }
    }
    return result
}
