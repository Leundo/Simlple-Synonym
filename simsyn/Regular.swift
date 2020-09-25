//
//  Regular.swift
//  simsyn
//
//  Created by Leundo on 2020/9/25.
//  Copyright © 2020 Leundo. All rights reserved.
//

import Foundation
class RegexService {
    public static let prefixRegex = "<div role=\"tooltip\" class=\"oh_oi oh_oj\"></div><a class=\"b4_co b4_b5 ta_co\" title=\""
    
    private static let rootRegex = ".+?"
    
    public static let suffixRegex = " synonym\""
    
    public static func pickUp(regex: String, aString: String) -> [String]{
        do {
            let regex: NSRegularExpression = try NSRegularExpression(pattern: regex, options: [])
            let matches = regex.matches(in: aString, options: [], range: NSMakeRange(0, aString.count))
            
            var data: [String] = []
            for item in matches {
                let string = (aString as NSString).substring(with: item.range)
                data.append(string)
            }
            
            return data
        }
        catch {
            return []
        }
    }
    
    public static func htmlPickUp(html: String) -> [String] {
        var data: [String] = []
        data = pickUp(regex: RegexService.prefixRegex + RegexService.rootRegex + RegexService.suffixRegex, aString: html)
        for i in 0..<data.count {
            data[i] = data[i].replace(ofRegex: RegexService.prefixRegex, with: "")
            data[i] = data[i].replace(ofRegex: RegexService.suffixRegex, with: "")
        }
        
        return data
    }
    
    
    
}

extension String {
    public func replace(ofRegex regex: String, with content: String) -> String {
        do {
            let RE = try NSRegularExpression(pattern: regex, options: .caseInsensitive)
            let modified = RE.stringByReplacingMatches(in: self, options: .reportProgress, range: NSRange(location: 0, length: self.count), withTemplate: content)
            return modified
        }
        catch {
            return self
        }
    }
}