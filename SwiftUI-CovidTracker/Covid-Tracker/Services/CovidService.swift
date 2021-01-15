//
//  CovidService.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 11.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import Foundation
import Combine
import CoreData

final class CovidService {
    
    private let apiProvider = APIProvider<CovidRoute>()
    private let jsonDecoder = JSONDecoder()
    
    func countriesData() -> AnyPublisher<CovidCountryResponse, Error> {
        return apiProvider.getData(from: .getGlobalData)
            .decode(type: CovidCountryResponse.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }
    
    func confirmedData() -> AnyPublisher<CovidStateModel, Error> {
        return apiProvider.getData(from: .getConfirmedData)
            .decode(type: CovidStateModel.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }
    
    func deathsData() -> AnyPublisher<CovidStateModel, Error> {
        return apiProvider.getData(from: .getDeathData)
            .decode(type: CovidStateModel.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }
    
    func recoveredData() -> AnyPublisher<CovidStateModel, Error> {
        return apiProvider.getData(from: .getRecoveredData)
            .decode(type: CovidStateModel.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }
}
