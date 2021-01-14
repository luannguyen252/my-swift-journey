//
//  URLSessionProtocol.swift
//  Webservice
//
//  Created by Apple on 20/06/20.
//  Copyright © 2020 Sparkout. All rights reserved.
//

import UIKit

var buffer:NSMutableData = NSMutableData()
   var urlSesion:URLSession?
   var expectedContentLength = 0

protocol URLSessionProtocol: AnyObject {
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
    func dataTask(request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol, URLSessionDelegate, URLSessionDataDelegate, URLSessionTaskDelegate {
    

    func dataTask(request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask {
        
        return dataTask(with: request, completionHandler: completionHandler)
    }
    
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (ResponseDisposition) -> Void) {
        expectedContentLength = Int(response.expectedContentLength)
        completionHandler(URLSession.ResponseDisposition.allow)
    }
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        buffer.append(data)
        
        let percentageDownloaded = Float(buffer.length) / Float(expectedContentLength)
        print(percentageDownloaded)
        
    }
    
    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print(error.debugDescription)
    }
}
