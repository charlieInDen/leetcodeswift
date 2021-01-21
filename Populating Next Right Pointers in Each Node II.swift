//
//  Populating Next Right Pointers in Each Node II.swift
//  Leetcode
//
//  Created by Nishant on 21/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.

 Initially, all next pointers are set to NULL.

  

 Follow up:

 You may only use constant extra space.
 Recursive approach is fine, you may assume implicit stack space does not count as extra space for this problem.
 
 Reference: https://leetcode.com/problems/populating-next-right-pointers-in-each-node-ii/
 */
public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

func connect(_ root: Node?) -> Node? {
    guard let root = root else { return nil }
    var queue = [root]
    while queue.count > 0 {
        for i in 0..<queue.count-1 {
            queue[i].next = queue[i+1]
        }
        queue = queue.flatMap {
            [$0.left, $0.right].compactMap { $0 }
        }
    }
    return root
}
