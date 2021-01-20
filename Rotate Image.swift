//
//  Rotate Image.swift
//  Leetcode
//
//  Created by Nishant on 20/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).
 
 You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.
 
 Reference:https://leetcode.com/problems/rotate-image/
 */
func rotate(_ matrix: inout [[Int]]) {
    guard !matrix.isEmpty else { return }
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            if j >= i {
                let temp = matrix[j][i]
                matrix[j][i] = matrix[i][j]
                matrix[i][j] = temp
            }
        }
    }
    for i in 0..<matrix.count {
        var start = 0
        var end = matrix[i].count - 1
        while start < end {
            matrix[i].swapAt(start, end)
            start = start + 1
            end = end - 1
        }
    }
}
