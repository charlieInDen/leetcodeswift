//
//  Coin Change 2.swift
//  Leetcode
//
//  Created by Nishant on 26/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 You are given coins of different denominations and a total amount of money. Write a function to compute the number of combinations that make up that amount. You may assume that you have infinite number of each kind of coin.

Reference: https://leetcode.com/problems/coin-change-2/
 */
func change(_ amount: Int, _ coins: [Int]) -> Int {
    var dp = Array(repeating: 0, count: amount + 1)
    dp[0] = 1
    
    for coin in coins {
        if coin >= amount + 1 { continue }
        for i in coin..<amount + 1 {
            dp[i] = dp[i] + dp[i - coin]
        }
    }
    return dp[amount]
}
