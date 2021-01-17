//
//  UserService.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 14/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import Foundation

protocol UserServicing {
    typealias UserFetchCompletion = (Result<User, AppError>) -> Void
    
    func getUser(id: Int, completion: @escaping UserFetchCompletion)
}

class UserService: UserServicing {
    var apiManager: APIManaging
    
    init(apiManager: APIManaging) {
        self.apiManager = apiManager
    }
    
    func getUser(id: Int, completion: @escaping UserFetchCompletion) {
        apiManager.request(path: "users") { (result: Result<[User], AppError>) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let fetchedUsers):
                guard
                    let user = fetchedUsers.filter({ $0.id == id }).first
                else {
                    completion(.failure(AppError.somethingWentReallyWrong))
                    
                    return
                }
                
                completion(.success(user))
            }
        }
    }
}
