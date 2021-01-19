//
//  Median of Two Sorted Arrays.swift
//  Leetcode
//
//  Created by Nishant on 19/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
 
 Reference: https://leetcode.com/problems/median-of-two-sorted-arrays/
 */
//O(N+M) using Merge Sort, walking the two arrays until we get to the median pivot point.
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    
    let items = nums1.count + nums2.count
    let  medianIndex = items / 2
    
    var x = 0
    var y = 0
    
    var medianLeft = 0
    var medianCenterRight = 0
    
    while x + y <= medianIndex {
        let xValue = (x < nums1.count) ? nums1[x] : nil
        let yValue = (y < nums2.count) ? nums2[y] : nil
        let newValue = min(xValue ?? Int.max, yValue ?? Int.max)
        
        if x + y < medianIndex {
            medianLeft = newValue
        } else {
            medianCenterRight = newValue
        }
        
        if xValue == newValue { x += 1 } else
            if yValue == newValue { y += 1 }
    }
    
    if items % 2 == 1 { // Odd
        return Double(medianCenterRight)
    } else { // Even
        return Double(medianLeft + medianCenterRight) / 2
    }
}
