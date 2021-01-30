//
//  Unique Email Addresses.swift
//  Leetcode
//
//  Created by Nishant on 26/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 Given a list of emails, we send one email to each address in the list.  How many different addresses actually receive mails?
 
 Reference: https://leetcode.com/problems/unique-email-addresses/
 */
func getUniqueMail(_ email: String) -> String {
    let letters = Array(email)
    var output: String = ""
    for i in 0..<letters.count {
        if letters[i] == "+" { break }
        else if letters[i] == "." { continue }
        else {
            output = output + String(letters[i])
        }
    }
    return output
}
func numUniqueEmails(_ emails: [String]) -> Int {
    var uniqueEmails: Set<String> = Set<String>()
    emails.forEach { (email) in
        let temp = email.components(separatedBy: "@")
        let unique = getUniqueMail(temp.first!)
        let tempEmail = "\(unique)@\(temp.last!)"
        uniqueEmails.insert(tempEmail)
    }
    return uniqueEmails.count
}
