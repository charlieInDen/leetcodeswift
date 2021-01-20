//
//  Merge Two Sorted Lists.swift
//  Leetcode
//
//  Created by Nishant on 20/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Merge two sorted linked lists and return it as a sorted list. The list should be made by splicing together the nodes of the first two lists.

Reference: https://leetcode.com/problems/merge-two-sorted-lists/
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var head = ListNode(-1)
    var list1 = l1
    var list2 = l2
    var prev: ListNode? = head
    while list1 != nil && list2 != nil {
        guard let val1 = list1?.val, let val2 = list2?.val else { return nil }
        if val1 > val2 {
            prev?.next = list2
            list2 = list2?.next
        } else {
            prev?.next = list1
            list1 = list1?.next
        }
        prev = prev?.next
    }
    prev?.next = (list1 == nil) ? list2 : list1
    return head.next
}
