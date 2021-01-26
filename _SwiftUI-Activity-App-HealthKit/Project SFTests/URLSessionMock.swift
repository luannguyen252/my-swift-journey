//
//  URLSessionMock.swift
//  Project SFTests
//
//  Created by William Taylor on 11/7/20.
//

import Foundation

class URLSessionDataTaskMock: URLSessionDataTask {
    
    // MARK: Properties
    
    private let completion: () -> Void
    
    // MARK: Init
    
    init(completion: @escaping () -> Void) {
        self.completion = completion
    }
    
    // MARK: Overriden Methods
    
    override func resume() {
        completion()
    }
    
}

class URLSessionMock: URLSession {
    
    // MARK: Properties
    
    var data: Data?
    
    var urlResponse: URLResponse?
    
    var error: Error?
    
    // MARK: Init
    
    override init() {
        super.init()
    }
    
    // MARK: Overriden Methods
    
    override func dataTask(with url: URL,
                           completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let data = self.data
        let urlResponse = self.urlResponse
        let error = self.error
        
        return URLSessionDataTaskMock {
            completionHandler(data, urlResponse, error)
        }
    }
    
}
