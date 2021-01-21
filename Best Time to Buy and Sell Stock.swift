//
//  Best Time to Buy and Sell Stock.swift
//  Leetcode
//
//  Created by Nishant on 21/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 You are given an array prices where prices[i] is the price of a given stock on the ith day.
 
 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
 
 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
 Reference: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
 */
func maxProfit(_ prices: [Int]) -> Int {
    var max = 0
    var profit = 0
    for price in prices.reversed() {
        if profit < max - price {
            profit = max - price
        }
        if price > max {
            max = price
        }
    }
    return profit
}
