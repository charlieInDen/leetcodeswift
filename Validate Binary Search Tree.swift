//
//  Validate Binary Search Tree.swift
//  Leetcode
//
//  Created by Nishant on 21/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given the root of a binary tree, determine if it is a valid binary search tree (BST).

 A valid BST is defined as follows:

 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
 
 Reference: https://leetcode.com/problems/validate-binary-search-tree/
 */
func isValidBST(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    var stack: [TreeNode] = []
    var previous = Int.min
    var parent: TreeNode? = root
    while stack.isEmpty == false || parent != nil {
        while parent != nil {
            if let parent = parent {
                stack.append(parent)
            }
            parent = parent?.left
        }
        let node = stack.removeLast()
        if node.val <= previous {
            return false
        }
        previous = node.val
        parent = node.right
        
    }
    return true
}
