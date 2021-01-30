//
//  Sum of Left Leaves.swift
//  Leetcode
//
//  Created by Nishant on 25/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Find the sum of all left leaves in a given binary tree.
 
 Reference: https://leetcode.com/problems/sum-of-left-leaves/
 */
func helper(_ root: TreeNode?,_ total: inout Int) {
    if root == nil { return }
    if let left = root?.left, left.left == nil, left.right == nil {
        total = total + left.val
    }
    if let right = root?.right {
        helper(right, &total)
    }
    if let left = root?.left {
        helper(left, &total)
    }
}
func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    var result = 0
    helper(root, &result)
    return result
}
