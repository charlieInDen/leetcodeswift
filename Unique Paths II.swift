//
//  Unique Paths II.swift
//  Leetcode
//
//  Created by Nishant on 20/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
 
 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
 
 Now consider if some obstacles are added to the grids. How many unique paths would there be?
 
 An obstacle and space is marked as 1 and 0 respectively in the grid.
 
 Reference: https://leetcode.com/problems/unique-paths-ii/
 */
func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    var grid = obstacleGrid
    let row = grid.count
    let col = grid[0].count
    //Base case
    if grid.isEmpty || grid[0][0] == 1 { return 0 }
    grid[0][0] = 1
    for i in 1..<row {
        grid[i][0] = (grid[i][0] == 0 && grid[i-1][0] == 1) ? 1 : 0
    }
    for j in 1..<col {
        grid[0][j] = (grid[0][j] == 0 && grid[0][j - 1] == 1) ? 1 : 0
    }
    for i in 1..<row {
        for j in 1..<col {
            if grid[i][j] == 0 {
                grid[i][j] = grid[i-1][j] + grid[i][j-1]
            } else {
                grid[i][j] = 0
            }
        }
    }
    return grid[row - 1][col - 1]
}
