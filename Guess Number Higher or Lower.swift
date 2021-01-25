//
//  Guess Number Higher or Lower.swift
//  Leetcode
//
//  Created by Nishant on 25/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 We are playing the Guess Game. The game is as follows:

 I pick a number from 1 to n. You have to guess which number I picked.

 Every time you guess wrong, I will tell you whether the number I picked is higher or lower than your guess.

 You call a pre-defined API int guess(int num), which returns 3 possible results:

 -1: The number I picked is lower than your guess (i.e. pick < num).
 1: The number I picked is higher than your guess (i.e. pick > num).
 0: The number I picked is equal to your guess (i.e. pick == num).
 Return the number that I picked.

Reference: https://leetcode.com/problems/guess-number-higher-or-lower/
 */
/**
* Forward declaration of guess API.
* @param  num -> your guess number
* @return          -1 if the picked number is lower than your guess number
*                  1 if the picked number is higher than your guess number
*               otherwise return 0
* func guess(_ num: Int) -> Int
*/

func guessNumber(_ n: Int) -> Int {
      var low = 1
      var high = n
      
      while low <= high {
          let mid = low + (high - low) / 2
          let res = guess(mid)
          if res == 0 {
              return mid
          }else if res == -1 {
              high = mid - 1
          }else {
              low = mid + 1
          }
      }
      
      return low
  }
