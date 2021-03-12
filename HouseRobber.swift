//
//  HouseRobber.swift
//  ProblemSolving_LeetCode
//
//  Created by Avneesh on 12/03/21
//
import Foundation
/*
Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.
 Reference:- https://leetcode.com/problems/house-robber/
*/
class Solution {
    func rob(_ nums: [Int]) -> Int {
        let arrSize = nums.count
        guard arrSize > 1 else { return nums[0] }
        
        var result = Array<Int>(repeating: 0, count: arrSize)
        result[0] = nums[0]
        result[1] = max(nums[0], nums[1])
        
        for index in 2..<arrSize {
            result[index] = max(result[index-2] + nums[index], result[index-1])
        }
        return result[arrSize - 1]
    }
}

