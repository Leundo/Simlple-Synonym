//
//  Regular.swift
//  simsyn
//
//  Created by Leundo on 2020/9/25.
//  Copyright © 2020 Leundo. All rights reserved.
//

import Foundation
class RegexService {
//    public static let prefixRegex = "<div role=\"tooltip\" class=\"oh_oi oh_oj\"></div><a class=\"b4_co b4_b5 ta_co\" title=\""
    
//    private static let prefixRegex = "<div role=\"tooltip\" class=\"n6_n7 n6_n8\"></div><a class=\"b3_co b3_b4 ta_co\" title=\""
    
    private static let prefixRegex = "<div role=\"tooltip\" class=\"[0-9a-z]{2}_[0-9a-z]{2} [0-9a-z]{2}_[0-9a-z]{2}\"></div><a class=\"[0-9a-z]{2}_[0-9a-z]{2} [0-9a-z]{2}_[0-9a-z]{2} [0-9a-z]{2}_[0-9a-z]{2}\" title=\""
    
    private static let rootRegex = ".+?"
    
    private static let suffixRegex = " synonym\""
    
    private static let robotRegex = "We need to make sure you are not a robot."
    
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
        data = pickUp(regex: prefixRegex + rootRegex + suffixRegex, aString: html)
        for i in 0..<data.count {
            data[i] = data[i].replace(ofRegex: prefixRegex, with: "")
            data[i] = data[i].replace(ofRegex: suffixRegex, with: "")
        }
        
        return data
    }
    
    // 判断是否是机器人验证页面
    public static func isRobotHtml(html: String) -> Bool {
        let data = pickUp(regex: robotRegex, aString: html)
        if data.count > 0 {
            return true
        }
        return false
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
