//
//  Word Search II.swift
//  Leetcode
//
//  Created by Nishant on 24/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given an m x n board of characters and a list of strings words, return all words on the board.
 
 Reference: https://leetcode.com/problems/word-search-ii/
 */
class TrieNode {
    var children: [Character: TrieNode] = [Character: TrieNode]()
    var word: String?
}

class Solution {
    var result: [String] = []
    var direction = [[0,1], [1,0], [-1,0], [0,-1]]
    func traverse(_ row: Int, _ col: Int, _ node: TrieNode,_ board: [[Character]], _ visited: inout [[Bool]]) {
        let boardLetter = board[row][col]
        var currentNode = node.children[boardLetter]
        if let word = currentNode?.word {
            result.append(word)
            currentNode?.word = nil
        }
        visited[row][col] = true
        
        for d in direction {
            let nRow = row + d[0]
            let nCol = col + d[1]
            if nRow < 0 || nRow >= board.count || nCol < 0 || nCol >= board[0].count {
                continue
            }
            if (currentNode?.children.keys.contains(board[nRow][nCol]) ?? false && visited[nRow][nCol] == false) {
                traverse(nRow, nCol, currentNode!, board, &visited)
            }
        }
        visited[row][col] = false
    }
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        guard board.count > 0 else {
            return []
        }
        result.removeAll()
        //Create Trie for comparision - O(log h) - h height or string length
        let root: TrieNode = TrieNode()
        words.forEach { (word) in
            var start = root
            let letters = Array(word)
            letters.forEach { (singleLetter) in
                if let childNode = start.children[singleLetter] {
                    start = childNode
                } else {
                    let childNode = TrieNode()
                    start.children[singleLetter] = childNode
                    start = childNode
                }
            }
            start.word = word
        }
        var visited: [[Bool]] = [[Bool]]()
        let rCount = board.count
        let cCount = board[0].count
        for _ in 0..<rCount {
            visited.append(Array(repeating: false, count: cCount))
        }
        // Back track for each cell in board
        for i in 0..<rCount {
            for j in 0..<board[i].count {
                if root.children.keys.contains(board[i][j]) {
                    traverse(i, j, root, board, &visited)
                }
            }
        }
        
        return result
    }
}
