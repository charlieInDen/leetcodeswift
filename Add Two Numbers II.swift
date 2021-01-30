//
//  Add Two Numbers II.swift
//  Leetcode
//
//  Created by Nishant on 26/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 Reference: https://leetcode.com/problems/add-two-numbers-ii/
 */
struct val {
    let x: Int
    let y: Int
}
class Solution {
    func getLength(_ l1: ListNode?) -> Int {
        var list1 = l1
        var count = 0
        while list1 != nil {
            count = count + 1
            list1 = list1?.next
        }
        return count
    }
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var stack: [val] = []
        var list1 = l1
        var list2 = l2
        let len1 = getLength(l1)
        let len2 = getLength(l2)
        var diff = len2 > len1 ? (len2 - len1) : (len1 - len2)
        let maxVal  = max(len1, len2)
        if len1 != len2 {
            if maxVal == len1 {
                while diff != 0 && list1 != nil {
                    let v1 = list1?.val ?? 0
                    let v2 = 0
                    stack.append(val(x: v1, y: v2))
                    diff = diff - 1
                    list1 = list1?.next
                }
            }else if maxVal == len2 {
                while diff != 0 && list2 != nil {
                    let v1 = list2?.val ?? 0
                    let v2 = 0
                    stack.append(val(x: v1, y: v2))
                    diff = diff - 1
                    list2 = list2?.next
                }
            }
        }
        
        
        while list1 != nil || list2 != nil {
            let v1 = list1?.val ?? 0
            let v2 = list2?.val ?? 0
            
            stack.append(val(x: v1, y: v2))
            list1 = list1?.next
            list2 = list2?.next
        }
        var carry: Int = 0
        var result: ListNode?
        var start: ListNode?
        while stack.isEmpty == false {
            let lastVal = stack.removeLast()
            print(lastVal.x, lastVal.y)
            let sum = lastVal.x + lastVal.y + carry
            if start == nil {
                start = ListNode(sum%10)
                result = start
            } else {
                let node = ListNode(sum%10)
                result = node
                result?.next = start
                start = result
            }
            carry = sum/10
        }
        if carry != 0 {
            let node = ListNode(carry)
            result = node
            result?.next = start
        }
        return result
    }
}
