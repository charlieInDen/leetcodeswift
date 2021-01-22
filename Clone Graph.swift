//
//  Clone Graph.swift
//  Leetcode
//
//  Created by Nishant on 21/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given a reference of a node in a connected undirected graph.
 
 Return a deep copy (clone) of the graph.
 
 Reference:
 */
func bfs(_ node: Node?) -> Node? {
    var hashMap: [Int: Node] = [ : ]
    var queue: [Node] = []
    if let node = node {
        queue.append(node)
        let cNode = Node(node.val)
        cNode.neighbors = []
        hashMap[node.val] = cNode
    }
    while queue.isEmpty == false {
        var currentNode: Node?
        let first = queue.removeFirst()
        
        for n in first.neighbors {
            if let node = n, hashMap[node.val] == nil {
                queue.append(node)
                let cloneNode = Node(node.val)
                cloneNode.neighbors = []
                hashMap[node.val] = cloneNode
                hashMap[first.val]?.neighbors.append(cloneNode)
            } else {
                hashMap[first.val]?.neighbors.append(hashMap[n!.val])
            }
        }
    }
    return hashMap[node!.val]
}
func cloneGraph(_ node: Node?) -> Node? {
    guard let node = node else { return nil }
    return bfs(node)
}
