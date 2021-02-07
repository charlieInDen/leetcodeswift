//
//  Prison Cells After N Days.swift
//  Leetcode
//
//  Created by Nishant on 05/02/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 There are 8 prison cells in a row, and each cell is either occupied or vacant.

 Each day, whether the cell is occupied or vacant changes according to the following rules:

 If a cell has two adjacent neighbors that are both occupied or both vacant, then the cell becomes occupied.
 Otherwise, it becomes vacant.
 (Note that because the prison is a row, the first and the last cells in the row can't have two adjacent neighbors.)

 We describe the current state of the prison in the following way: cells[i] == 1 if the i-th cell is occupied, else cells[i] == 0.

 Given the initial state of the prison, return the state of the prison after N days (and N such changes described above.)


 Reference: https://leetcode.com/problems/prison-cells-after-n-days/
 */
class PrisonSolution {
    func prisonAfterNDays(_ cells: [Int], _ N: Int) -> [Int] {
        var pre = cells
        var cur = [Int](repeating: 0, count: 8)
        let N = (N - 1) % 14 + 1
        for _ in 0..<N {
            for j in 1..<7 {
                cur[j] = (pre[j-1] == pre[j+1]) ? 1 : 0
            }
            pre = cur
        }
        return cur
    }
}
