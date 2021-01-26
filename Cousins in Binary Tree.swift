//
//  Cousins in Binary Tree.swift
//  Leetcode
//
//  Created by Nishant on 26/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 In a binary tree, the root node is at depth 0, and children of each depth k node are at depth k+1.

 Two nodes of a binary tree are cousins if they have the same depth, but have different parents.

 We are given the root of a binary tree with unique values, and the values x and y of two different nodes in the tree.

 Return true if and only if the nodes corresponding to the values x and y are cousins.
 
 Reference: https://leetcode.com/problems/cousins-in-binary-tree/
 */
func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
    var queue: [(node: TreeNode, depth: Int, parentVal: Int)] = [(root!, 0, -1)]
    var xd: (depth: Int?, parentVal: Int) = (nil, -1), yd: (depth: Int?, parentVal: Int) = (nil, -1)
    while queue.count > 0 {
        let (node, depth, parentVal) = queue.removeLast()
        if node.val == x { xd = (depth, parentVal) }
        if node.val == y { yd = (depth, parentVal) }
        if xd.depth != nil && yd.depth != nil { return xd.depth == yd.depth && xd.parentVal != yd.parentVal }
        if node.left != nil { queue.append((node.left!, depth + 1, node.val)) }
        if node.right != nil { queue.append((node.right!, depth + 1, node.val)) }
    }
    return false
}
