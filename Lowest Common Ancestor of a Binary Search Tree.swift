//
//  Lowest Common Ancestor of a Binary Search Tree.swift
//  Leetcode
//
//  Created by Nishant on 24/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given nodes in the BST.
 
 Reference: https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
 */
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    if root == nil { return nil }
    var current: TreeNode? = root
    while current != nil {
        guard let p = p, let q = q, let temp = current else { return nil }
        if temp.val > p.val && temp.val > q.val {
            current = temp.left
        }
        else if temp.val < p.val && temp.val < q.val {
            current = temp.right
        }else { return current }
    }
    return nil
}
