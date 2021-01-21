//
//  Binary Tree Level Order Traversal.swift
//  Leetcode
//
//  Created by Nishant on 21/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

 For example:
 Given binary tree [3,9,20,null,null,15,7],
 
 Reference: https://leetcode.com/problems/binary-tree-level-order-traversal/
 */
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var queue: [TreeNode] = []
    var result:[[Int]] = []
    guard let root = root else { return result }
    queue.append(root)
    
    while queue.isEmpty == false {
        var count = queue.count
        var level: [Int] = []
        while count > 0 {
            let node = queue.removeFirst()
            level.append(node.val)
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
            count = count - 1
        }
        result.append(level)
    }
    return result
}
