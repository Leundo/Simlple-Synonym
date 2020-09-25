//
//  IO.swift
//  simsyn
//
//  Created by Leundo on 2020/9/25.
//  Copyright © 2020 Leundo. All rights reserved.
//

import Foundation

class IOService {
    
    private static let HELP_INFO = "this is help"
    private static let ERROR_INFO = "error: unknown argument: "
    private static let N_ERROR_INFO_1 = "error: "
    private static let N_ERROR_INFO_2 = " can't convert to number"
    
    public static func input(args: [String]) -> Void {
        var word = ""
        let argsNum = args.count
        var i = 1
        var isFirstWord = true
        
        var numOfPrintedSynonym = 10
        
        while i < argsNum {
            // 不是命令
            if !args[i].hasPrefix("-") {
                if isFirstWord {
                    word += args[i]
                    isFirstWord = false
                    i += 1
                    continue
                } else {
                    word += "_" + args[i]
                    i += 1
                    continue
                }
            }
            
            let cmd = args[i].replace(ofRegex: "-", with: "")
            // 命令判断
            switch cmd {
            case "h":
                print(HELP_INFO)
                return
            case "n":
                i += 1
                if let num = Int(args[i]) {
                    numOfPrintedSynonym = num
                } else {
                    print(N_ERROR_INFO_1 + "\(args[i])" + N_ERROR_INFO_2)
                    return
                }
            default:
                print(ERROR_INFO + args[i])
                return
            }
            
            i += 1
        } // End while

        output(word: word, numOfPrintedSynonym: numOfPrintedSynonym)
    }
    
    private static func output(word: String, numOfPrintedSynonym num: Int) -> Void {
        let data: Data?
//        let response: URLResponse?
//        let error: Error?
//        (data, response, error) = SynHttpService.get(word: word)
        data = SynHttpService.get(word: word).data

        if let html = String(data: data!, encoding: .utf8 ) {
            
            // 控制输出的同义词数目
            var i = num

            for synWord in RegexService.htmlPickUp(html: html) {
                print(synWord, terminator: "\n")
                i -= 1
                if i <= 0 {
                    break
                }
            }
            
        } else {
            print("Error")
        }
    }
    
    
}
