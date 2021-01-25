//
//  Serialize and Deserialize Binary Tree.swift
//  Leetcode
//
//  Created by Nishant on 25/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

 Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.
 
 Reference: https://leetcode.com/problems/serialize-and-deserialize-binary-tree/
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
    func serializeHelper(_ root: TreeNode?,_ output: inout String) {
        if root == nil {
            output = output + "null" + " "
            return
        }
        output = output + String(root!.val) + " "
        
        serializeHelper(root?.left, &output)
        serializeHelper(root?.right, &output)
    }
    func serialize(_ root: TreeNode?) -> String {
        if root == nil { return "" }
        var output = ""
        serializeHelper(root, &output)
        print(output)
        return output
    }
    func deserializehelper(_ result: inout [String]) -> TreeNode? {
        if result.isEmpty == true { return nil }
        let value = result.removeFirst()
        var node: TreeNode?
        if value == "null" {
            return nil
        } else {
            node = TreeNode(Int(value)!)
        }
        node?.left = deserializehelper(&result)
        node?.right = deserializehelper(&result)
        return node
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        if data.isEmpty { return nil }
        var result = data.components(separatedBy: " ")
        return deserializehelper(&result)
    }
}
// Your Codec object will be instantiated and called as such:
// var codec = Codec()
// codec.deserialize(codec.serialize(root))
