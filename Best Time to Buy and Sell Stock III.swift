//
//  Best Time to Buy and Sell Stock III.swift
//  Leetcode
//
//  Created by Nishant on 21/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Design an algorithm to find the maximum profit. You may complete at most two transactions.
 
 
 Reference: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/
 */
func maxProfit(_ prices: [Int]) -> Int {
    var t1Cost = Int.max
    var t2Cost = Int.max
    var t1Profit = 0
    var t2Profit = 0
    
    prices.forEach { (price) in
        t1Cost = min(t1Cost, price)
        t1Profit = max(t1Profit, price - t1Cost)
        t2Cost = min(t2Cost, price - t1Profit)
        t2Profit = max(t2Profit, price - t2Cost)
    }
    return t2Profit
}
