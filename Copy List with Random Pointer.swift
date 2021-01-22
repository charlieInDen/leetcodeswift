//
//  Copy List with Random Pointer.swift
//  Leetcode
//
//  Created by Nishant on 21/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 A linked list is given such that each node contains an additional random pointer which could point to any node in the list or null.
 
 Return a deep copy of the list.
 
 Reference: https://leetcode.com/problems/copy-list-with-random-pointer/
 */
func copyRandomList(_ head: Node?) -> Node? {
    if head == nil { return nil }
    var start = head
    // Insert cloned node next to orginal node
    while start != nil {
        let next = start?.next
        start?.next = Node(start!.val)
        start?.next?.next = next
        start = next
    }
    start = head
    // Create random link to cloned nodes only
    while start != nil {
        let originalRandom = start?.random
        let clonedNode = start?.next
        clonedNode?.random = originalRandom?.next
        start = clonedNode?.next
    }
    // separate cloned and original
    // Unweave the linked list to get back the original linked list and the cloned list.
    // i.e. A->A'->B->B'->C->C' would be broken to A->B->C and A'->B'->C'
    var clonedNode: Node?
    var startClone: Node?
    start = head
    while start != nil {
        let cNode = start?.next
        start?.next = cNode?.next
        startClone?.next =  cNode
        startClone = cNode
        if clonedNode == nil { clonedNode = startClone }
        start = start?.next
    }
    return clonedNode
}
