//
//  APIProvider.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 11.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import Foundation
import Combine

final class APIProvider<Route: APIRoute> {
    
    func getData(from endpoint: Route) -> AnyPublisher<Data, Error> {
        guard let request = performRequest(for: endpoint) else {
            return Fail(error: APIProviderErrors.invalidURL)
                .eraseToAnyPublisher()
        }
        
        return loadData(with: request)
            .eraseToAnyPublisher()
    }
}

private extension APIProvider {
    
    // MARK: - Request building
    private func performRequest(for endpoint: Route) -> URLRequest? {
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = endpoint.baseURL
        if let path = endpoint.path {
            urlComponents.path = path
        }

        guard let url = urlComponents.url else {
            return nil
        }

        return URLRequest(url: url,
                                    cachePolicy: .reloadRevalidatingCacheData,
                                    timeoutInterval: 30)
    }
    
    // MARK: - Getting data
    private func loadData(with request: URLRequest) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .mapError { APIProviderErrors.httpError(code: $0.errorCode) }
            .eraseToAnyPublisher()
    }
}
