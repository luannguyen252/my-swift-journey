//
//  APIManager.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 12/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import Foundation

protocol APIManaging {
    func request<T: Decodable>(path: String, completion: @escaping (Result<T, AppError>) -> Void)
}

class APIManager: APIManaging {
    let jsonDecoder = JSONDecoder()
    
    func request<T: Decodable>(path: String, completion: @escaping (Result<T, AppError>) -> Void) {
        guard
            let url = Bundle.main.url(forResource: path, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let decoded = try? jsonDecoder.decode(T.self, from: data)
        else {
            completion(.failure(AppError.somethingWentReallyWrong))
        
            return
        }
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            completion(.success(decoded))
        }
    }
}
