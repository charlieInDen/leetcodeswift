//
//  Construct Binary Search Tree from Preorder Traversal.swift
//  Leetcode
//
//  Created by Nishant on 27/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Return the root node of a binary search tree that matches the given preorder traversal.

 (Recall that a binary search tree is a binary tree where for every node, any descendant of node.left has a value < node.val, and any descendant of node.right has a value > node.val.  Also recall that a preorder traversal displays the value of the node first, then traverses node.left, then traverses node.right.)


 Reference: https://leetcode.com/problems/construct-binary-search-tree-from-preorder-traversal/
 */
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class ConstructSolution {
    var inorder: [Int]!
    var map: [Int: Int] = [ : ]
    var preIndex = 0
    var preorder: [Int]!
    func helper(_ start: Int, _ end: Int) -> TreeNode? {
        if start == end { return nil }
        
        let elem = preorder[preIndex]
        let node = TreeNode(elem)
        preIndex = preIndex + 1
        
        guard let index = map[elem] else { return nil }
        node.left = helper(start, index)
        node.right = helper(index + 1, end)
        
        return node
    }
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        self.preorder = preorder
        inorder = preorder.sorted()
        map.removeAll()
        var index = 0
        for e in inorder {
            map[e] = index
            index = index + 1
        }
        return helper(0, inorder.count)
    }
}


