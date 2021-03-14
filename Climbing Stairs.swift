//
//  Climbing Stairs.swift
//  ProblemSolving_LeetCode
//
//  Created by Avneesh on 14/03/21.
//

import Foundation
/*
 You are climbing a staircase. It takes n steps to reach the top.
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 Reference:- https://leetcode.com/problems/climbing-stairs/
 */
class Solution {
    var memoize = Array<Int>(repeating: 0, count: 46) // Size is taken as per the given constraint
    func climbStairs(_ n: Int) -> Int {
        switch n {
        case 0:
            memoize[0] = 1
            return memoize[0]
        case 1:
            memoize[1] = 1
            return memoize[1]
        default:
            if memoize[n - 1] != 0, memoize[n - 2] != 0 {
                return memoize[n - 1] + memoize[n - 2]
            } else {
                memoize[n] = climbStairs(n - 1) + climbStairs(n - 2)
                return memoize[n]
            }
        }
    }
}
