//
//  Request.swift
//  simsyn
//
//  Created by Leundo on 2020/9/24.
//  Copyright © 2020 Leundo. All rights reserved.
//

import Foundation

class SynHttpService {
    private static let SynUrlPrefix = "https://www.powerthesaurus.org/"
    
    static func get(word: String) -> (data: Data?, response: URLResponse?, error: Error?) {
        
        var data: Data?
        var response: URLResponse?
        var error: Error?
        let sema = DispatchSemaphore(value: 0)
        
        guard let url = URL(string: SynHttpService.SynUrlPrefix + word) else { fatalError("Could not create URL object") }
        var request = URLRequest(url: url)
        request.setValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36", forHTTPHeaderField: "User-Agent")
        // 新建线程获取请求
        
        let dataTask = URLSession(configuration: .default).dataTask(with: request) {
            data = $0
            response = $1
            error = $2
            
            sema.signal()
        }
        
        dataTask.resume()
        _ = sema.wait(timeout: .now() + 10)
        
        return (data, response, error)
    }
    
}


