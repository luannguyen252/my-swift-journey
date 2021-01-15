//
//  CovidFAQService.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 13.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import Foundation
import Combine

final class CovidFAQService {
    
    private let apiProvider = APIProvider<CovidFAQRoute>()
    private let jsonDecoder = JSONDecoder()
    
    func getFAQData() -> AnyPublisher<CovidFAQResponse, Error> {
        return apiProvider.getData(from: .getCovidFAQData)
            .decode(type: CovidFAQResponse.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }
}
