//
//  String to Integer (atoi).swift
//  Leetcode
//
//  Created by Nishant on 19/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer (similar to C/C++'s atoi function).
 
 Reference: https://leetcode.com/problems/string-to-integer-atoi/
 */
func myAtoi(_ str: String) -> Int {
    var num: Int? = nil
    var isMinus: Bool? = nil
    
    for a in str {
        let s = String(a)
        if num == nil && isMinus == nil && (s == " " || s == "-" || s == "+"){
            if s == "-" || s == "+" {
                isMinus = s == "-"
            }
            continue
        }
        if let i = Int(s){
            let ii = (isMinus ?? false) ? i * -1 : i
            if (num ?? 0) > 214748364 || (num == 214748364 && ii > 7) {
                return 2147483647
            }
            if (num ?? 0) < -214748364 || (num == -214748364 && ii < -8) {
                return -2147483648
            }
            num = (num ?? 0) * 10 + ii
        }else{
            break
        }
    }
    return num ?? 0
}
