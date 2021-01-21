//
//  Maximum Depth of Binary Tree.swift
//  Leetcode
//
//  Created by Nishant on 21/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given the root of a binary tree, return its maximum depth.
 
 
 Reference: https://leetcode.com/problems/maximum-depth-of-binary-tree/
 */
func maxDepth(_ root: TreeNode?) -> Int {
    if root == nil { return 0 }
    if root?.left == nil && root?.right == nil {
        return 1
    }
    let leftDepth = 1 + maxDepth(root?.left)
    let rightDepth = 1 + maxDepth(root?.right)
    if leftDepth > rightDepth {
        return leftDepth
    }
    return rightDepth
}
