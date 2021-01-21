//
//  Binary Tree Zigzag Level Order Traversal.swift
//  Leetcode
//
//  Created by Nishant on 21/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).
 
 Reference: https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/
 */
func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    var queue: [TreeNode] = []
    var result:[[Int]] = []
    guard let root = root else { return result }
    queue.append(root)
    var isLeftDirection = false
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
        if isLeftDirection == false {
            result.append(level)
        }else {
            result.append(level.reversed())
        }
        isLeftDirection = isLeftDirection == false ? true : false
    }
    return result
}
