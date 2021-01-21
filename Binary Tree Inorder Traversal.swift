//
//  Binary Tree Inorder Traversal.swift
//  Leetcode
//
//  Created by Nishant on 21/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given the root of a binary tree, return the inorder traversal of its nodes' values.
 
 Reference: https://leetcode.com/problems/binary-tree-inorder-traversal/
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
func inorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }
    var stack: [TreeNode] = []
    var rootNode: TreeNode? = root
    var result: [Int] = []
    while stack.isEmpty == false || rootNode != nil {
        while rootNode != nil {
            if let rNode = rootNode {
                stack.append(rNode)
            }
            rootNode = rootNode?.left
        }
        let node = stack.removeLast()
        result.append(node.val)
        rootNode = node.right
        
    }
    return result
}
