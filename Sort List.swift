//
//  Sort List.swift
//  Leetcode
//
//  Created by Nishant on 21/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given the head of a linked list, return the list after sorting it in ascending order.

 Follow up: Can you sort the linked list in O(n logn) time and O(1) memory (i.e. constant space)?
 
 Reference:https://leetcode.com/problems/sort-list/
 */
func sortList(_ head: ListNode?) -> ListNode? {
       if head == nil || head?.next == nil { return head }
       var slow: ListNode? = head
       var fast: ListNode? = head?.next
       while fast != nil && fast?.next != nil {
           slow = slow?.next
           fast = fast?.next?.next
       }
       var left: ListNode? = head
       var right: ListNode? = slow?.next
       slow?.next = nil
       left = sortList(left)
       right = sortList(right)
       return merge(left, right)
   }
   
   func merge(_ left: ListNode?, _ right: ListNode?) -> ListNode? {
       if left == nil { return right }
       if right == nil { return left }
       var head: ListNode?
       if left!.val > right!.val {
           head = right
           head?.next = merge(left, right?.next)
       }else {
           head = left
           head?.next = merge(left?.next, right)
       }
       return head
   }
