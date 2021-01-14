//
//  URLSessionProvider.swift
//  Webservice
//
//  Created by Apple on 20/06/20.
//  Copyright © 2020 Sparkout. All rights reserved.
//

import Foundation

class NetworkLogger {
    static func log(request: URLRequest) {
        
        print("\n <- - - - - - - - - - URL Request - - - - - - - - - -> \n")
        defer { print("\n <- - - - - - - - - -  END - - - - - - - - - -> \n") }
        
        let urlAsString = request.url?.absoluteString ?? ""
        let urlComponents = URLComponents(string: urlAsString)
        
        let method = request.httpMethod != nil ? "\(request.httpMethod ?? "")" : ""
        let path = "\(urlComponents?.path ?? "")"
        let query = "\(urlComponents?.query ?? "")"
        let host = "\(urlComponents?.host ?? "")"
        
        var logOutput = """
        \(urlAsString) \n\n
        \(method) \(path)?\(query) HTTP/1.1 \n
        HOST: \(host)\n
        """
        for (key,value) in request.allHTTPHeaderFields ?? [:] {
            logOutput += "\(key): \(value) \n"
        }
        if let body = request.httpBody {
            logOutput += "\n \(NSString(data: body, encoding: String.Encoding.utf8.rawValue) ?? "")"
        }
        
        print(logOutput)
    }
    
    static func log(response: URLResponse?, responseData:Data?) {
        print("\n <- - - - - - - - - - URL Response - - - - - - - - - -> \n")
        defer { print("\n <- - - - - - - - - -  END - - - - - - - - - -> \n") }
        
        let urlAsString = response?.url?.absoluteString ?? ""
        guard let data = responseData else { return }
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            
            let logOutput = """
            \(urlAsString) \n\n
            \(json) \n
            """
            print(logOutput)
        }
        catch {
            print(error)
        }
    }
}
