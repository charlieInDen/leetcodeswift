//
//  Intersection of Two Linked Lists.swift
//  Leetcode
//
//  Created by Nishant on 22/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Write a program to find the node at which the intersection of two singly linked lists begins.
 
 Reference: https://leetcode.com/problems/intersection-of-two-linked-lists/
 
 */
func getListSize(_ l1: ListNode?) -> Int {
    var count = 0
    var start = l1
    while start != nil {
        count = count + 1
        start = start?.next
    }
    return count
}
func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    let l1 = getListSize(headA)
    let l2 = getListSize(headB)
    let maxVal = l1 > l2 ? l1 : l2
    var diff = l1 > l2 ? l1 - l2 : l2 - l1
    var list2 = headB
    var list1 = headA
    if diff != 0 {
        if maxVal == l1 {
            while diff > 0 {
                list1 = list1?.next
                diff = diff - 1
            }
        }else {
            while diff > 0 {
                list2 = list2?.next
                diff = diff - 1
            }
        }
    }
    while list1 !== list2 {
        list1 = list1?.next
        list2 = list2?.next
    }
    return list1
}
