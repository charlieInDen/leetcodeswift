//
//  Encode and Decode TinyURL.swift
//  Leetcode
//
//  Created by Nishant on 29/01/21.
//  Copyright © 2021 Personal. All rights reserved.
//

import Foundation
/*
 TinyURL is a URL shortening service where you enter a URL such as https://leetcode.com/problems/design-tinyurl and it returns a short URL such as http://tinyurl.com/4e9iAk.

 Design the encode and decode methods for the TinyURL service. There is no restriction on how your encode/decode algorithm should work. You just need to ensure that a URL can be encoded to a tiny URL and the tiny URL can be decoded to the original URL.
 
 Reference: https://leetcode.com/problems/encode-and-decode-tinyurl/
 */
class Codec {
    var map1 = [String: String]()
    var map2 = [String: String]()
    var counter = 0
    
    func encode(_ longUrl: String) ->  String {
        counter += 1
        let shortUrl = "http://tinyurl.com/\(counter)"
        map1.updateValue(shortUrl, forKey: longUrl)
        map2.updateValue(longUrl, forKey: shortUrl)
        return shortUrl
    }
    
    // Decodes a shortened URL to its original URL.
    func decode(_ shortUrl: String) ->  String {
        if map2.keys.contains(shortUrl) {
            return map2[shortUrl] ?? ""
        }
        return ""
    }
}

