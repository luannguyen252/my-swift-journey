//
//  RequestEntries.swift
//  JournalingApp
//
//  Created by Philipp Baldauf on 23.02.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import Foundation
import Combine

class RequestEntries {
    
    private let url = URL(string: "http://localhost:8080/entries")!
    private var cancellable: Cancellable?
    
    func requestAllEntries(result: @escaping (Result<[Entry], Error>) -> Void ) {
        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Entry].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    result(.failure(error))
                default:
                    break // nothing to do here
                }
            }) {
                result(.success($0))
        }
    }
    
    func create(entry: Entry) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(entry)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        self.cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
                
            }) { (data, response) in
                if let string = String(data: data, encoding: .utf8) {
                    print(string)
                }
        }
    }
}
