//
//  Add Two Numbers.swift
//  Leetcode
//
//  Created by Nishant on 19/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
 
 Reference: https://leetcode.com/problems/add-two-numbers/
 */

//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var result: ListNode?
    var start: ListNode?
    var list1 = l1
    var list2 = l2
    var carry: Int = 0
    var num: Int = 0
    while list1 != nil || list2 != nil {
        let val1 = list1?.val ?? 0
        let val2 = list2?.val ?? 0
        let sum: Int = val1 + val2 + carry
        num = sum%10
        if start == nil {
            start = ListNode(num)
            result = start
        }else {
            start?.next = ListNode(num)
            start = start?.next
        }
        carry = sum/10
        
        list1 = list1?.next
        list2 = list2?.next
    }
    if carry != 0 {
        start?.next = ListNode(carry)
    }
    return result
}
