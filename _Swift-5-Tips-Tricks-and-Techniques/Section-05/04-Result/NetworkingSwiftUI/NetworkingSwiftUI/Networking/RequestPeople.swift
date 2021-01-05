//
//  RequestPeople.swift
//  NetworkingSwiftUI
//
//  Created by Philipp Baldauf on 22.02.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import Foundation
import Combine

class RequestPeople {
    
    private let url = URL(string: "https://swapi.co/api/people/")!
    
    private var cancellable: Cancellable?
    
    func requestAllPeople(resultCompletion: @escaping (Result<[Character], Error>) -> Void ) {
        request(url: url, resultCompletion: resultCompletion)
    }
    
    private func request(url: URL, resultCompletion: @escaping (Result<[Character], Error>) -> Void ) {
        self.cancellable = request(url: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure(let error):
                    resultCompletion(.failure(error))
                default:
                    break // nothing to do here
                }
            }) { [weak self] (people) in
                resultCompletion(.success(people.results))
                if let next = people.next, let nextURL = URL(string: next) {
                    self?.request(url: nextURL, resultCompletion: resultCompletion)
                }
        }
    }
    
    private func request(url: URL) -> AnyPublisher<People, Error> {
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10.0)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: People.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
