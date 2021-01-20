//
//  Trapping Rain Water.swift
//  Leetcode
//
//  Created by Nishant on 20/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining
 Reference: https://leetcode.com/problems/trapping-rain-water/
 */
func trap(_ height: [Int]) -> Int {
    if height.isEmpty { return 0 }
    var result = 0
    var leftMax: Int = 0
    var rightMax: Int = 0
    var left = 0
    var right = height.count - 1
    while left < right {
        if height[left] < height[right] {
            if leftMax <= height[left] {
                leftMax = height[left]
            } else {
                result = result + (leftMax - height[left])
            }
            left = left + 1
        }else {
            if rightMax <= height[right] {
                rightMax = height[right]
            } else {
                result = result + (rightMax - height[right])
            }
            right = right - 1
        }
    }
    return result
}
