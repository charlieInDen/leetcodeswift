//
//  Largest Number.swift
//  Leetcode
//
//  Created by Nishant on 01/02/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation

class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        let strings = nums.map { String($0) }.sorted { $0 + $1 > $1 + $0 }
        if nums.reduce(into: Bool(false), { $0 = $0 || $1 > 0 }) {
            return strings.joined()
        } else {
            return "0"
        }
    }
}
