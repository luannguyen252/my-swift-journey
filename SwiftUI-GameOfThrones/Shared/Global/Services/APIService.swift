//
//  APIService.swift
//  Game-of-Thrones-SwiftUI
//
//  Created by Christian Elies on 01.08.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import Combine
import Foundation

protocol APIServiceProvider {
    var apiService: APIService { get }
}

final class APIService {
    private let urlSession: URLSession = .shared
    private let baseURL = URL(string: "https://www.anapioficeandfire.com/api")!
    private lazy var housesURL: URL = {
        return baseURL.appendingPathComponent("/houses")
    }()
    private lazy var jsonDecoder: JSONDecoder = {
        return JSONDecoder()
    }()
    
    func getHouses(page: Int, pageSize: Int) -> AnyPublisher<[HouseResponseModel], Error> {
        let queryItemPage = URLQueryItem(name: "page", value: "\(page)")
        let queryItemPageSize = URLQueryItem(name: "pageSize", value: "\(pageSize)")
        
        var urlComponents = URLComponents(url: housesURL,
                                          resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [queryItemPage, queryItemPageSize]
        
        guard let url = urlComponents?.url else {
            return Fail(error: APIServiceError.couldNotCreateURL).eraseToAnyPublisher()
        }
        
        let housesUrlRequest = URLRequest(url: url)
        return urlSession.dataTaskPublisher(for: housesUrlRequest)
            .map { $0.data }
            .decode(type: [HouseResponseModel].self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }
    
    func getHouse(atURL url: URL) -> AnyPublisher<HouseResponseModel, Error> {
        let houseURLRequest = URLRequest(url: url)
        return urlSession.dataTaskPublisher(for: houseURLRequest)
            .map { $0.data }
            .decode(type: HouseResponseModel.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }
}
