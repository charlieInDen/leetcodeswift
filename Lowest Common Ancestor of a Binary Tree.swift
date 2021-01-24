//
//  Lowest Common Ancestor of a Binary Tree.swift
//  Leetcode
//
//  Created by Nishant on 24/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.
 
 Reference: https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/
 */
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root, let p = p, let q = q else { return nil }
    if root.val == p.val { return root }
    if root.val == q.val { return root }
    let left = lowestCommonAncestor(root.left, p, q)
    let right = lowestCommonAncestor(root.right, p, q)
    if left != nil && right != nil {
        return root
    }
    if let left = left {
        return left
    }
    return right
}
