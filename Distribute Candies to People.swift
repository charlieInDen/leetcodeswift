//
//  Distribute Candies to People.swift
//  Leetcode
//
//  Created by Nishant on 27/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 We distribute some number of candies, to a row of n = num_people people in the following way:

 We then give 1 candy to the first person, 2 candies to the second person, and so on until we give n candies to the last person.

 Then, we go back to the start of the row, giving n + 1 candies to the first person, n + 2 candies to the second person, and so on until we give 2 * n candies to the last person.

 This process repeats (with us giving one more candy each time, and moving to the start of the row after we reach the end) until we run out of candies.  The last person will receive all of our remaining candies (not necessarily one more than the previous gift).

 Return an array (of length num_people and sum candies) that represents the final distribution of candies.
 
 Reference: https://leetcode.com/problems/distribute-candies-to-people/
 */
func distributeCandies(_ candies: Int, _ num_people: Int) -> [Int] {
    var candies = candies
    var allocation: [Int] = Array(repeating: 0, count: num_people)
    var n = 0
    while candies > 0 {
        if candies - (n + 1) < 0 {
            allocation[n % num_people] += candies
            candies = 0
        } else {
            allocation[n % num_people] += n + 1
            candies -= (n + 1)
        }
        n += 1
    }
    return allocation
}
