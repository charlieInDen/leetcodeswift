//
//  LRU Cache.swift
//  Leetcode
//
//  Created by Nishant on 21/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//
/*
 Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

 Implement the LRUCache class:

 LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
 int get(int key) Return the value of the key if the key exists, otherwise return -1.
 void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.
 Follow up:
 Could you do get and put in O(1) time complexity?


 Reference: https://leetcode.com/problems/lru-cache/
 */
import Foundation
class Node {
    var key: Int?
    var value: Int?
    var next: Node?
    var prev: Node?
}
class DLinkList {
    
    var head: Node = Node()
    var tail: Node = Node()
    
    func addNode(_ node: Node) {
        node.prev = head
        node.next = head.next
        head.next?.prev = node
        head.next = node
    }
    
    func removeNode(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
    
    func moveToHead(_ node: Node) {
        removeNode(node)
        addNode(node)
    }
    
    func dropLast() -> Node {
        let last =  tail.prev!
        removeNode(last)
        return last
    }
}


class LRUCache {
    private var dll: DLinkList?
    private var map: [Int: Node] = [Int: Node]()
    private var size: Int = 0
    private let capacity: Int
    init(_ capacity: Int) {
        self.dll = DLinkList()
        self.dll?.head.next = dll?.tail
        self.dll?.tail.prev = dll?.head
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let node = map[key], let value = node.value else { return -1 }
        dll?.moveToHead(node)
        return value
    }
    
    func put(_ key: Int, _ value: Int) {
        /// Check from cache
        let node = map[key]
        /// If not exist - Create new node and cache it
        if node == nil {
            let newNode = Node()
            newNode.key = key
            newNode.value = value
            /// Make entry in cache & add to Doubly link list
            map[key] = newNode
            dll?.addNode(newNode)
            size = size + 1
            
            if size > capacity {
                if let droppedNode = dll?.dropLast() {
                    map.removeValue(forKey: droppedNode.key!)
                }
                size = size - 1
            }
            
        } else {
            node!.value = value
            dll?.moveToHead(node!)
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
