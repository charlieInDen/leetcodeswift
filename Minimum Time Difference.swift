//
//  Count of Smaller Numbers After Self .swift
//
//  Created by Parmod on 31/01/21.
//  Copyright © 2020 Parmod. All rights reserved.
//
import Foundation
/**
 Given a list of 24-hour clock time points in "HH:MM" format, return the minimum minutes difference between any two time-points in the list.
    
 * Input: timePoints = ["23:59","00:00"]
 * Output: 1
 
*/

func findMinDifference(_ timePoints: [String]) -> Int {
    func timeToInt(_ value: String) -> Int {
        let time = value.split(separator: ":")
        return Int(String(time[0]))! * 60 + Int(String(time[1]))!
    }
    
    let totalMinutes = 1440
    var timeArray: [Int] = [Int](repeating: 0, count: totalMinutes)
    timePoints.forEach { timeArray[timeToInt($0)] += 1 }
    
    if timeArray.first(where: { $0 > 1 }) != nil { return 0 }
    
    var lastOnesIndex = -1, firstOnesIndex = -1
    var minDifference = totalMinutes / 2
    for (index, item) in timeArray.enumerated() {
        if item > 0 {
            if lastOnesIndex < 0 {
                lastOnesIndex = index
                firstOnesIndex = index
            } else {
                let diff = index - lastOnesIndex
                if diff < minDifference { minDifference = diff }
                lastOnesIndex = index
            }
        }
    }
    
    let diff = (totalMinutes - lastOnesIndex) + firstOnesIndex
    if diff < minDifference {
        minDifference = diff
    }
    
    return minDifference
}

