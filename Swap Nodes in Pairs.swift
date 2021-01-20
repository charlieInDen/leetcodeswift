//
//  Swap Nodes in Pairs.swift
//  Leetcode
//
//  Created by Nishant on 20/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given a linked list, swap every two adjacent nodes and return its head.

Reference: https://leetcode.com/problems/swap-nodes-in-pairs/
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
func swapPairs(_ head: ListNode?) -> ListNode? {
    var head = head
    var node = head
    var pre: ListNode? = nil

    while node != nil && node!.next != nil {
        let cur = node!.next!
        let tmp = cur.next

        if pre == nil {
            head = cur
        } else {
            pre!.next = cur
        }

        cur.next = node
        node!.next = tmp

        pre = node
        node = tmp
    }
    return head
}
