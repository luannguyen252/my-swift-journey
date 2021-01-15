//
//  CovidFAQViewModel.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 12.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import Foundation
import Combine

final class CovidFAQViewModel: ObservableObject {
    private let covidFAQService = CovidFAQService()
    
    private var bag = Set<AnyCancellable>()
    
    @Published private(set) var questions: [CovidFAQModel] = []
    
    let loadData = PassthroughSubject<Void, Error>()
    
    init() {
        configure()
    }
    
    func configure() {
        loadData
            .flatMap { [weak self] _ -> AnyPublisher<CovidFAQResponse, Error> in
                guard let self = self else {
                    return Empty(completeImmediately: true)
                        .eraseToAnyPublisher()
                }
                return self.covidFAQService.getFAQData()
            }
            .map { $0.data }
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \.questions, on: self)
            .store(in: &bag)
    }
}
