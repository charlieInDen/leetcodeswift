//
//  Container With Most Water.swift
//  Leetcode
//
//  Created by Nishant on 19/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of the line i is at (i, ai) and (i, 0). Find two lines, which, together with the x-axis forms a container, such that the container contains the most water.
 
 Reference: https://leetcode.com/problems/container-with-most-water/
 */
func maxArea(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count - 1
    var ans = 0
    while left < right {
        let area = (right - left) * min(height[left], height[right])
        ans = max(ans, area)
        if height[left] < height[right] {
            left = left + 1
        }
        else {
            right = right - 1
        }
    }
    return ans
}
