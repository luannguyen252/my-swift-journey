//
//  PostService.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 14/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import Foundation

protocol PostServicing {
    typealias PostFetchCompletion = (Result<[Post], AppError>) -> Void
    
    func getPosts(completion: @escaping PostFetchCompletion)
}

class PostService: PostServicing {
    var apiManager: APIManaging
    
    init(apiManager: APIManaging) {
        self.apiManager = apiManager
    }
    
    func getPosts(completion: @escaping PostFetchCompletion) {
        apiManager.request(path: "posts") { (result: Result<[Post], AppError>) in
            completion(result)
        }
    }
}
