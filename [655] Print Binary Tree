//
//  Print Binary Tree.swift
//  Leetcode
//
//  Created by Parmod on 24/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

//Definition of Tree Node
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

class Solution {
    /// getBinaryTreeHeight takes root node of the binary tree as parameter and returns height of the binary tree
    /// - Parameter rootNode: root node of binary tree
    /// - Returns: height of binary tree
    /// - Complexity:  O(n)
    /// Height of this tree is "3"
    ///                         1
    ///                        /     \
    ///                       2        3
    ///                      /
    ///                     4
    ///
    private func getBinaryTreeHeight(_ rootNode: TreeNode?) -> Int {
        // if root node is nil then return with zero height
        guard let rootNode = rootNode else {
            return 0
        }
        
        //util method to calculate height of tree from given level
        func heightUtil(_ rootNode: TreeNode, _ calculatedHeight: Int, _ currentHeight: inout Int) {
            // if calculated height is more than current height of the tree then update current height of tree
            if calculatedHeight > currentHeight {
                currentHeight = calculatedHeight
            }
            
            if let leftNode = rootNode.left {
                heightUtil(leftNode, calculatedHeight + 1, &currentHeight)
            }
            
            if let rightNode = rootNode.right {
                heightUtil(rightNode, calculatedHeight + 1, &currentHeight)
            }
        }
        
        // initialize height with 1
        var height: Int = 1
        heightUtil(rootNode, height, &height)
        return height
    }
    
    /// fill all the nodes in resultant matrix at approriate position
    /// - Parameters:
    ///   - node: node of the binary tree
    ///   - resultMatrix: resultant matrix address
    ///   - lhs: left side of the tree
    ///   - rhs: right ide of the tree
    ///   - currentLevel: level of the current node in binary tree
    /// - Complexity: O(n)
    ///
    /// - Binary Tree:
    ///
    ///                         1
    ///                        /     \
    ///                       2        3
    ///                      /
    ///                     4
    ///
    ///  - Returns:
    /// [
    ///     ["", "", "", "1", "", "", ""],
    ///     ["", "2", "", "", "", "3", ""],
    ///     ["4", "", "", "", "", "", ""]
    /// ]
    private func fillResultMatrix(_ node: TreeNode?, _ resultMatrix: inout [[String]], _ lhs: Int, _ rhs: Int, _ currentLevel: Int) {
        // if node is nil then return
        guard let node = node else {
            return
        }
        
        // calculate mid item
        let mid: Int = (lhs + rhs) / 2
        resultMatrix[currentLevel][mid] = "\(node.val)"
        
        // calculate for left sub tree if exist
        if let leftNode: TreeNode = node.left {
            fillResultMatrix(leftNode, &resultMatrix, lhs, mid, currentLevel + 1)
        }
        
        // calculate for right sub tree if exist
        if let rightNode: TreeNode = node.right {
            fillResultMatrix(rightNode, &resultMatrix, mid, rhs, currentLevel + 1)
        }
    }
    
    /*
     Print a binary tree in an m*n 2D string array following these rules:
     
     The row number m should be equal to the height of the given binary tree.
     The column number n should always be an odd number.
     The root node's value (in string format) should be put in the exactly middle of the first row it can be put. The column and the row where the root node belongs will separate the rest space into two parts (left-bottom part and right-bottom part). You should print the left subtree in the left-bottom part and print the right subtree in the right-bottom part. The left-bottom part and the right-bottom part should have the same size. Even if one subtree is none while the other is not, you don't need to print anything for the none subtree but still need to leave the space as large as that for the other subtree. However, if two subtrees are none, then you don't need to leave space for both of them.
     Each unused space should contain an empty string "".
     Print the subtrees following the same rules.
     Example 1:
     Input:
     1
     /
     2
     Output:
     [["", "1", ""],
     ["2", "", ""]]
     */
    func printTree(_ root: TreeNode?) -> [[String]] {
        // first calculate height of the binary tree
        let height: Int = getBinaryTreeHeight(root)
        //find max width of any level in the tree can have with this height
        let width: Int = Int(pow(Double(2),Double(height))) - 1
        // allocate a resutant matrix of empty strings of size height * width
        var resultMatrix: [[String]] = Array(repeating: Array(repeating: "", count: width), count: height)
        // fill the resultant matrix with binary tree nodes values
        fillResultMatrix(root, &resultMatrix, 0, width, 0)
        // return the resultant matrix
        return resultMatrix
    }
}
