//
//  Binary Tree Level Order Traversal II.swift
//  Leetcode
//
//  Created by Nishant on 21/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).
 
 
 Reference: https://leetcode.com/problems/binary-tree-level-order-traversal-ii/
 */
func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
    var result: [[Int]] = [[Int]]()
    guard let root = root else { return result }
    
    var queue: [TreeNode] = []
    queue.append(root)
    var size = queue.count
    while queue.isEmpty == false {
        var levelElements: [Int] = []
        size = queue.count
        while size > 0 {
            guard let droppedElement = queue.first else { return result }
            queue.removeFirst(1)
            if let left = droppedElement.left {
                queue.append(left)
            }
            if let right = droppedElement.right {
                queue.append(right)
            }
            size = size - 1
            levelElements.append(droppedElement.val)
        }
        result.append( levelElements)
    }
    result.reverse()
    return result
}
