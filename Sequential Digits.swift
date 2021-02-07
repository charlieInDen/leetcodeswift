//
//  Sequential Digits.swift
//
//  Created by Parmod on 07/02/21.
//  Copyright © 2020 Parmod. All rights reserved.
//
import Foundation
/**
 An integer has sequential digits if and only if each digit in the number is one more than the previous digit.

 Return a sorted list of all the integers in the range [low, high] inclusive that have sequential digits.

    
 * Input: low = 100, high = 300
 * Output: [123,234]
 
*/

class SequentialDigitsSolution {
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        // low digits count range to hight digits count range
        var result: [Int] = []
        
        func addValue(_ value: String) -> Bool {
            guard let intValue = Int(value), intValue <= high else { return false }
            if intValue >= low { result.append(intValue) }
            return true
        }
        
        for currentDigitCount in low.count...high.count {
            var str: String = ""
            for (index,value) in ["1","2","3","4","5","6","7","8","9"].enumerated() {
                if index < currentDigitCount {
                    str.append(value)
                    if index == currentDigitCount - 1 {
                        guard addValue(str) else { break }
                    }
                    continue
                }
                
                str.remove(at: str.startIndex)
                str.append(value)
                guard addValue(str) else { break }
            }
        }
        return result
    }
}

extension Int {
    var count: Int {
        var count = floor(log10(Double(self))) + 1
        return Int(count)
    }
}
