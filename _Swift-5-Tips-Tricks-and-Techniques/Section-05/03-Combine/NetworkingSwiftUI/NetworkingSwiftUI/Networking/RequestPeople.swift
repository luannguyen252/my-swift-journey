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
    
    private let publisher: AnyPublisher<[Character], Error>
    
    private var cancellable: Cancellable?
    
    init() {
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10.0)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        self.publisher = session.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: People.self, decoder: JSONDecoder())
            .tryMap { $0.results }
            .eraseToAnyPublisher()
    }
    
    func request<Root>(to: ReferenceWritableKeyPath<Root, [Character]>, on: Root) {
        self.cancellable = publisher.receive(on: DispatchQueue.main)
        .replaceError(with: [])
        .assign(to: to, on: on)
    }
    
}
