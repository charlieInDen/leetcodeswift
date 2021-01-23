//
//  Reverse Linked List.swift
//  Leetcode
//
//  Created by Nishant on 22/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Reverse a singly linked list.
 
 Reference: https://leetcode.com/problems/reverse-linked-list/
 */
func reverseList(_ head: ListNode?) -> ListNode? {
    
    var node: ListNode? = head
    var prev: ListNode? = nil
    while node != nil {
        let next = node?.next
        node?.next = prev
        prev = node
        node = next
    }
    return prev
}
