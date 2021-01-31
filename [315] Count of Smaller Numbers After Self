//
//  Count of Smaller Numbers After Self .swift
//
//  Created by Parmod on 17/07/20.
//  Copyright © 2020 Parmod. All rights reserved.
//
import Foundation
/*
  You are given an integer array nums and you have to return a new counts array.
  The counts array has the property where counts[i] is the number of smaller elements to the right of nums[i].
*/

typealias SmallerElementsCount = Int

//print(countSmaller([7, 5,2,6,1]))
func countSmaller(_ nums: [Int]) -> [Int] {
    let reversedArr: [Int] = nums.reversed()
    var smallerElementsCountArray: [SmallerElementsCount] = []
    guard let last = reversedArr.first else {
        return smallerElementsCountArray
    }
    
    let bst: BST = BST(rootNode: BSTNode(data: last))
    
    for index in 1...reversedArr.count - 1 {
        let smallerElementCount: SmallerElementsCount =  bst.insertNode(node: BSTNode(data: reversedArr[index]))
        smallerElementsCountArray.append(smallerElementCount)
    }
    
    smallerElementsCountArray.reverse()
    smallerElementsCountArray.append(0)
    return smallerElementsCountArray
}

class BSTNode {
    let data: Int
    var count: Int = 1
    var leftNode: BSTNode?
    var rightNode: BSTNode?
    
    init(data: Int) {
        self.data = data
    }
}

class BST {
    private let rootNode: BSTNode
    
    init(rootNode: BSTNode) {
        self.rootNode = rootNode
    }
    
    private func insertNode(node: BSTNode, current: BSTNode, smallerElementsCount: inout SmallerElementsCount) {
        if current.data < node.data {
            smallerElementsCount += current.count
            if let rightNode = current.rightNode {
                insertNode(node: node, current: rightNode, smallerElementsCount: &smallerElementsCount)
            } else {
                current.rightNode = node
            }
        } else {
            current.count += 1
            if let leftNode = current.leftNode {
                insertNode(node: node, current: leftNode, smallerElementsCount: &smallerElementsCount)
            } else {
                current.leftNode = node
            }
        }
        
    }
    
    func insertNode(node: BSTNode) -> SmallerElementsCount {
        var smallerElementsCount: SmallerElementsCount = 0
        insertNode(node: node, current: rootNode, smallerElementsCount: &smallerElementsCount)
        return smallerElementsCount
    }
}
