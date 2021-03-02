//
//  Can You Eat Your Favorite Candy on Your Favorite Day?.swift
//  Leetcode
//
//  Created by Parmod on 02/03/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 You are given a (0-indexed) array of positive integers candiesCount where candiesCount[i] represents the number of candies of the ith type you have. You are also given a 2D array queries where queries[i] = [favoriteTypei, favoriteDayi, dailyCapi].

 You play a game with the following rules:

 You start eating candies on day 0.
 You cannot eat any candy of type i unless you have eaten all candies of type i - 1.
 You must eat at least one candy per day until you have eaten all the candies.
 Construct a boolean array answer such that answer.length == queries.length and answer[i] is true if you can eat a candy of type favoriteTypei on day favoriteDayi without eating more than dailyCapi candies on any day, and false otherwise. Note that you can eat different types of candy on the same day, provided that you follow rule 2.

 Return the constructed array answer.
 
 Reference: https://leetcode.com/problems/can-you-eat-your-favorite-candy-on-your-favorite-day/
 */

class Solution {
    
    private func canEat(_ arr: [Int], _ q: [Int]) -> Bool {
            //type
            let t = q[0]
            let d = q[1] + 1    // plus one for day starting from 0
            let m = q[2]
            
            // range
            var l = 0
            if t > 0 { l = arr[t - 1] }
            let h = arr[t]
                  
            // if days are greater than highr value then return because minimum one candy per day
            if d > h {
                return false
            }
            
            if d * m  <= l {
                return false
            }
            
            
            return true
    }
    
    func canEat(_ candiesCount: [Int], _ queries: [[Int]]) -> [Bool] {
        var currSum = 0
        let arr: [Int] = candiesCount.map ({ (value: Int) -> Int in
            currSum += value
            return currSum
        })
        
        let count = candiesCount.count
        var result: [Bool] = []
        for q in queries {
            result.append(canEat(arr, q))
        }
        return result
    }
}
