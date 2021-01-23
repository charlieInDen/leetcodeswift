//
//  Number of Islands.swift
//  Leetcode
//
//  Created by Nishant on 22/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an m x n 2d grid map of '1's (land) and '0's (water), return the number of islands.
 
 
 Reference: https://leetcode.com/problems/number-of-islands/
 */
var direction = [[1,0], [0,1], [-1,0],[0,-1]]

func bfs(_ grid: [[Character]], _ visited: inout [[Bool]], _ row: Int, _ col: Int) {
    let rLen = grid.count
    let cLen = grid[0].count
    if visited[row][col] == false {
        visited[row][col] = true
        for i in 0..<direction.count {
            let nRow = row + direction[i][0]
            let nCol = col + direction[i][1]
            if nRow >= 0 && nCol >= 0 && nRow < rLen && nCol < cLen && visited[nRow][nCol] == false && grid[nRow][nCol] == "1" {
                bfs(grid, &visited, nRow, nCol)
            }
        }
    }
    
}
func numIslands(_ grid: [[Character]]) -> Int {
    guard grid.isEmpty == false else { return 0 }
    var visited: [[Bool]] = []
    var count = 0
    let rLen = grid.count
    let cLen = grid[0].count
    for _ in 0..<rLen {
        visited.append(Array(repeating: false, count: cLen))
    }
    for i in 0..<rLen {
        for j in 0..<cLen {
            if grid[i][j] == "1" && visited[i][j] == false {
                bfs(grid, &visited, i, j)
                count = count + 1
            }
        }
    }
    return count
}
