//
//  Rotting Oranges.swift
//  Leetcode
//
//  Created by Nishant on 27/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 You are given an m x n grid where each cell can have one of three values:
 
 0 representing an empty cell,
 1 representing a fresh orange, or
 2 representing a rotten orange.
 Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten.
 
 Return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return -1.
 
 Reference: https://leetcode.com/problems/rotting-oranges/
 */
class RottingSolution {
    func traverse(_ timeStamp: Int, _ grid: inout [[Int]], _ rLen: Int, _ cLen: Int) -> Bool {
        let directions = [[-1,0], [0,-1], [1,0],[0,1]]
        var result = false
        for r in 0..<rLen {
            for c in 0..<cLen {
                //2 means rotten initially and then more than 2 also becomes rotten
                if grid[r][c] == timeStamp {
                    for i in 0..<directions.count {
                        let nR = r + directions[i][0]
                        let nC = c + directions[i][1]
                        if nR >= 0 && nR < rLen && nC >= 0 && nC < cLen {
                            if grid[nR][nC] == 1 {
                                grid[nR][nC] = timeStamp + 1
                                result = true
                            }
                        }
                    }
                }
            }
        }
        return result
    }
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var matrix = grid
        let r = matrix.count
        let c = matrix[0].count
        var timestamp = 2
        while traverse(timestamp, &matrix, r, c) == true {
            print(timestamp)
            timestamp = timestamp + 1
        }
        //Check for fresh orange
        for i in 0..<r {
            for j in 0..<c {
                if matrix[i][j] == 1 {
                    return -1
                }
            }
        }
        return timestamp - 2
    }
}
