//
//  Design Browser History.swift
//  Leetcode
//
//  Created by Nishant on 27/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 You have a browser of one tab where you start on the homepage and you can visit another url, get back in the history number of steps or move forward in the history number of steps.

 Implement the BrowserHistory class:

 BrowserHistory(string homepage) Initializes the object with the homepage of the browser.
 void visit(string url) Visits url from the current page. It clears up all the forward history.
 string back(int steps) Move steps back in history. If you can only return x steps in the history and steps > x, you will return only x steps. Return the current url after moving back in history at most steps.
 string forward(int steps) Move steps forward in history. If you can only forward x steps in the history and steps > x, you will forward only x steps. Return the current url after forwarding in history at most steps.
 
 Reference: https://leetcode.com/problems/design-browser-history/
 */
class BrowserHistory {
    
    var history: [String]!
    var current: Int!
    var bound: Int!
    
    init(_ homepage: String) {
        history = [homepage]
        current = 0
        bound = 0
    }
    
    func visit(_ url: String) {
        current = current + 1
        if current == history.count {
            history.append(url)
        }else {
            history[current] = url
        }
        bound = current
    }
    
    func back(_ steps: Int) -> String {
        current = max(current - steps, 0)
        return history[current]
    }
    
    func forward(_ steps: Int) -> String {
        current = min(steps + current, bound)
        return history[current]
    }
}

/**
 * Your BrowserHistory object will be instantiated and called as such:
 * let obj = BrowserHistory(homepage)
 * obj.visit(url)
 * let ret_2: String = obj.back(steps)
 * let ret_3: String = obj.forward(steps)
 */
