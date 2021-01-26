//
//  Serialize and Deserialize BST.swift
//  Leetcode
//
//  Created by Nishant on 26/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Serialization is converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

 Design an algorithm to serialize and deserialize a binary search tree. There is no restriction on how your serialization/deserialization algorithm should work. You need to ensure that a binary search tree can be serialized to a string, and this string can be deserialized to the original tree structure.

 The encoded string should be as compact as possible.
 
 Reference: https://leetcode.com/problems/serialize-and-deserialize-bst/
 */
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Codec {
    func postOrder(_ root: TreeNode?, _ output: inout String) {
        if root == nil { return }
        postOrder(root?.left, &output)
        postOrder(root?.right, &output)
        output = output + String(root?.val ?? -1) + " "
    }
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
       var result: String =  ""
        if root == nil { return result }
        postOrder(root, &result)
        _ = result.removeLast()
        print(result)
        return result
    }
    func deserializeHelper(_ min: Int, _ max: Int,_ postOrder: inout [String]) -> TreeNode? {
        if postOrder.isEmpty { return nil }
        guard let last = Int(postOrder.last!) else {
            print("fail")
             return nil
        }
        if last < min || last > max { return nil }
        _ = postOrder.removeLast()
        let root = TreeNode(last)
        root.right = deserializeHelper(last, max , &postOrder)
        root.left = deserializeHelper(min, last, &postOrder)
        return root
    }
    
    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
       var post = data.components(separatedBy: " ")
        if post.isEmpty { return nil }
        return deserializeHelper(Int.min, Int.max, &post)
    }

}


/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * val s = obj.serialize(root)
 * let ans = obj.serialize(s)
*/

/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * val s = obj.serialize(root)
 * let ans = obj.serialize(s)
*/
