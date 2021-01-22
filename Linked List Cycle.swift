//
//  Linked List Cycle.swift
//  Leetcode
//
//  Created by Nishant on 21/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given head, the head of a linked list, determine if the linked list has a cycle in it.

Reference: https://leetcode.com/problems/linked-list-cycle/
 */

func hasCycle(_ head: ListNode?) -> Bool {
      if head == nil || head?.next == nil { return false }
      //For space complexity - use two pointer - slow & fast
      var slow = head
      var fast = head?.next
      while slow?.val != fast?.val {
          if fast == nil || fast?.next == nil { return false }
          slow = slow?.next
          fast = fast?.next?.next
      }
      return true;
  }
