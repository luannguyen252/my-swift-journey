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
    
    private let task: AnyPublisher<[Character], Error>
    
    private var cancellable: Cancellable?
    
    init()  {
        task = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data } // only work with the data from the result
            .decode(type: People.self, decoder: JSONDecoder())
            .tryMap { $0.results }
            .eraseToAnyPublisher()
    }
    
    func request<Root>(to: ReferenceWritableKeyPath<Root, [Character]>, on: Root) {
        self.cancellable = task.receive(on: DispatchQueue.main)
        .replaceError(with: [])
        .assign(to: to, on: on)
    }
}
