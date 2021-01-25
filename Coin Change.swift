//
//  Coin Change.swift
//  Leetcode
//
//  Created by Nishant on 25/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.
 
 Reference: https://leetcode.com/problems/coin-change/
 */
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    if amount <= 0 { return 0 }
    let max = amount + 1
    var dp = Array(repeating: max, count: max)
    dp[0] = 0
    for i in 1...amount {
        for j in 0..<coins.count {
            if coins[j] > i { continue }
            dp[i] = min(dp[i],dp[i-coins[j]] + 1)
        }
    }
    if dp[amount] > amount { return -1 }
    return dp[amount]
}
