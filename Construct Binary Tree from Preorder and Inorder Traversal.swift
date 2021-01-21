//
//  Construct Binary Tree from Preorder and Inorder Traversal.swift
//  Leetcode
//
//  Created by Nishant on 21/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given preorder and inorder traversal of a tree, construct the binary tree.
 
 Reference: https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
 */
struct Holder {
    static var preIndex: Int = 0
}
func recursiveBuild(_ preorder: [Int], _ inorder: [Int],_ start: Int,_ end: Int,_ map: [Int: Int]) -> TreeNode? {
    if start > end { return nil }
    if preorder.count <= Holder.preIndex { return nil }
    let root = TreeNode(preorder[Holder.preIndex])
    Holder.preIndex = Holder.preIndex + 1
    if start == end { return root }
    //Search for index in inorder
    if let inOrderIndex = map[root.val] {
        //Using index in Inorder traversal, construct left and right subtree
        root.left = recursiveBuild(preorder, inorder, start, inOrderIndex - 1, map)
        root.right = recursiveBuild(preorder, inorder, inOrderIndex + 1, end, map)
        
    }
    
    return root
}
func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    Holder.preIndex = 0
    var hashmap: [Int: Int] = [ : ]
    for (i, elem) in inorder.enumerated() {
        hashmap[elem] = i
    }
    return recursiveBuild(preorder, inorder, 0, inorder.count - 1, hashmap)
}
