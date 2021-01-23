//
//  Majority Element.swift
//  Leetcode
//
//  Created by Nishant on 22/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an array nums of size n, return the majority element.

Reference: https://leetcode.com/problems/majority-element/
 */
func majorityElement(_ nums: [Int]) -> Int {
    var majIndex = 0
    var count = 1
    //Find possible majority element loops through each element and maintains a count of nums[majIndex]. If the next element is same then increment the count, if the next element is not same then decrement the count, and if the count reaches 0 then changes the majIndex to the current element and set the count again to 1. So, the first phase of the algorithm gives us a major candidate element.
    for i in 1..<nums.count {
        if nums[majIndex] == nums[i] {
            count = count + 1
        }else {
            count = count - 1
        }
        if count == 0 {
            majIndex = i
            count = 1
        }
    }
    var result = 0
    //Validate whether it has majority or not
    for i in 0..<nums.count {
        if nums[i] == nums[majIndex] {
            result = result + 1
        }
    }
    if result > nums.count/2 {
        return nums[majIndex]
    }else {
        return -1
    }
    
}
