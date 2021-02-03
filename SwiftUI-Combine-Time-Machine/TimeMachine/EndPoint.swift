//
//  EndPoint.swift
//  TimeMachine
//
//  Created by Erez Mizrahi on 08/12/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import Foundation
import Combine


enum Endpoint {
    static let handler = RequestHandler()
    static let baseURL = "https://archive.org/wayback/available"
}

extension Endpoint {
    static func getOldSite(siteName: String, timestamp: String?) -> AnyPublisher<Archived, Error> {
        var components = URLComponents(string: baseURL)
        components?.queryItems = [
            URLQueryItem(name: "url", value: siteName),
            URLQueryItem(name: "timestamp", value: timestamp ?? "")
        ]
        
        if let url = components?.url  {
        return run(URLRequest(url: url))
        }
        
        return run(URLRequest(url: URL(string:baseURL)!))

    }
    
    static func run<T: Codable>(_ request: URLRequest) -> AnyPublisher<T, Error> {
        return handler.run(request)
            .map(\.data)
            .eraseToAnyPublisher()
    }
}


class Executer: ObservableObject {
    @Published var urlSite: Closest?
    
    func getData(urlString: String, timestamp: String?)  {
        let call = Endpoint.getOldSite(siteName: urlString, timestamp: timestamp ?? "")
          call.sink(receiveCompletion: { (_) in
          }) { (data) in
            self.urlSite = data.archivedSnapshots.closest
              
          }
          withExtendedLifetime(call, {})
    }
}


struct Archived: Codable {
    let archivedSnapshots: ArchivedSnapshots
    
    enum CodingKeys: String, CodingKey {
        case archivedSnapshots = "archived_snapshots"
    }
}

// MARK: - ArchivedSnapshots
struct ArchivedSnapshots: Codable {
    let closest: Closest
}

// MARK: - Closest
struct Closest: Codable {
    let available: Bool
    var url: String
    let timestamp, status: String
}


