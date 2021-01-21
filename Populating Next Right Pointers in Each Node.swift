//
//  Populating Next Right Pointers in Each Node.swift
//  Leetcode
//
//  Created by Nishant on 21/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/* Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.
 
 Reference: https://leetcode.com/problems/populating-next-right-pointers-in-each-node/
 */
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
