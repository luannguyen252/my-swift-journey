//
//  RequestPeople.swift
//  NetworkingUI
//
//  Created by Philipp Baldauf on 20.02.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import Foundation
import Combine

class RequestPeople {
    
    private let url = URL(string: "https://swapi.co/api/people/")!
    
    private var cancellable: Cancellable?
    
    func requestAllPeople(result: @escaping (Result<[Character], Error>) -> Void ) {
        request(url: url, result: result)
    }
    
    private func request(url: URL, result: @escaping (Result<[Character], Error>) -> Void ) {
        self.cancellable = request(url: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    result(.failure(error))
                default:
                    break // nothing to do here
                }
            }) { [weak self] people in
                result(.success(people.results))
                if let next = people.next, let nextURL = URL(string: next) {
                    self?.request(url: nextURL, result: result)
                }
        }
    }
    
    private func request(url: URL) -> AnyPublisher<People, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data } // only work with the data from the result
            .decode(type: People.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
