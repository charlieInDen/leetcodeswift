//
//  Reverse Nodes in k-Group.swift
//  Leetcode
//
//  Created by Nishant on 20/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
 
 Reference: https://leetcode.com/problems/reverse-nodes-in-k-group/
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func reverseList(_ list: ListNode, _ step: Int) -> ListNode {
    var node = list
    var pre: ListNode? = nil
    var step = step
    
    while step > 1 {
        let tmp = node.next!
        node.next = pre
        pre = node
        node = tmp
        step -= 1
    }
    node.next = pre
    return node
}

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard k > 1, head != nil else {
        return head
    }
    
    var step = 1
    var node = head
    var point = head
    var pre: ListNode? = nil
    var result: ListNode? = nil
    
    while point != nil {
        point = point!.next
        if step == k {
            let newHead = reverseList(node!, k)
            if pre != nil {
                pre!.next = newHead
            } else {
                result = newHead
            }
            pre = node
            pre!.next = point
            node = point
            step = 0
        }
        step += 1
    }
    if result == nil {
        result = head
    }
    return result
}
