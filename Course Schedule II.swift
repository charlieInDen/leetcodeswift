//
//  Course Schedule II.swift
//  Leetcode
//
//  Created by Nishant on 22/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 There are a total of n courses you have to take labelled from 0 to n - 1.

 Some courses may have prerequisites, for example, if prerequisites[i] = [ai, bi] this means you must take the course bi before the course ai.

 Given the total number of courses numCourses and a list of the prerequisite pairs, return the ordering of courses you should take to finish all courses.

 If there are many valid answers, return any of them. If it is impossible to finish all courses, return an empty array.
 
 Reference: https://leetcode.com/problems/course-schedule-ii/
 */
func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var indegrees = Array(repeating: 0, count: numCourses)
    var adjLists = Array(repeating: [Int](), count: numCourses)
    for prereq in prerequisites {
        adjLists[prereq[1]].append(prereq[0])
        indegrees[prereq[0]] += 1
    }
    var visited = Set<Int>()
    var res = [Int]()
    
    while visited.count != numCourses {
        var currNode = -1
        for i in 0..<numCourses {
            if !visited.contains(i) && indegrees[i] == 0 {
                currNode = i
                break
            }
        }
        
        if currNode == -1 {
            return [Int]()
        }
        
        res.append(currNode)
        visited.insert(currNode)
        
        for neighbor in adjLists[currNode] {
            indegrees[neighbor] -= 1
        }
    }
    
    return res
}
