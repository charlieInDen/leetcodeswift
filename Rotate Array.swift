//
//  Rotate Array.swift
//  Leetcode
//
//  Created by Nishant on 22/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an array, rotate the array to the right by k steps, where k is non-negative.

Reference:https://leetcode.com/problems/rotate-array/
 */
func gcd(_ a:Int,_ b:Int) -> Int {
    if b == 0 {
        return a
    }
    return gcd(b, a%b)
}
func rotate(_ nums: inout [Int], _ diff: Int) {
    var d = diff
    if nums.count == 0 || nums.count == 1 {
        return
    }
    while d > nums.count {
        d = d - nums.count
    }
    let k = nums.count - d
    let nSet = gcd(nums.count, k)
    
    for i in 0..<nSet {
        let t = nums[i]
        var j = i
        
        while true {
            var x = j + k
            if x >= nums.count {
                x = x - nums.count
            }
            if x == i {
                break
            }
            nums[j] = nums[x]
            j = x
        }
        nums[j] = t
    }
}
