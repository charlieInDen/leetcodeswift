//
//  Best Time to Buy and Sell Stock II.swift
//  Leetcode
//
//  Created by Nishant on 21/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).
 
 reference: https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/
 */
func maxProfit(_ prices: [Int]) -> Int {
   var min = 0
    var max = 0
    var profit = 0
    var i = 0
    var len = prices.count
    while i < len - 1 {
        while i + 1 < len && prices[i] >= prices[i+1] {
            i = i + 1
        }
        min = prices[i]

        while i + 1 < len && prices[i] <= prices[i+1] {
            i = i + 1
        }
        max = prices[i]
        profit = profit + max - min
    }
    return profit
}
