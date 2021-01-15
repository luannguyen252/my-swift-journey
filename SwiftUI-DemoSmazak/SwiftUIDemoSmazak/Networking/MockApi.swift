//
//  MockApi.swift
//  SwiftUIDemoSmazak
//
//  Created by Marek Přidal on 03/09/2019.
//  Copyright © 2019 Marek Přidal. All rights reserved.
//

import Foundation

final class MockApi: ApiProtocol {
    private var mockCheeses: [Cheese] {
        [
            Cheese(currencyCode: "CZK", date: Date(), price: 105, type: .standard, weight: 150),
            Cheese(currencyCode: "CZK", date: Date().addingTimeInterval(60 * 60 * 24), price: 115, type: .ermine, weight: 170),
            Cheese(currencyCode: "CZK", date: Date().addingTimeInterval(60 * 60 * 24 * 2), price: 115, type: .ermine, weight: 170),
            Cheese(currencyCode: "CZK", date: Date().addingTimeInterval(60 * 60 * 24 * 3), price: 105, type: .standard, weight: 150),
            Cheese(currencyCode: "CZK", date: Date().addingTimeInterval(60 * 60 * 24 * 4), price: 115, type: .ermine, weight: 170),
            Cheese(currencyCode: "CZK", date: Date().addingTimeInterval(60 * 60 * 24 * 5), price: 105, type: .standard, weight: 150),
            Cheese(currencyCode: "CZK", date: Date().addingTimeInterval(60 * 60 * 24 * 6), price: 115, type: .ermine, weight: 170),
            Cheese(currencyCode: "CZK", date: Date().addingTimeInterval(60 * 60 * 24 * 7), price: 105, type: .standard, weight: 150),
            Cheese(currencyCode: "CZK", date: Date().addingTimeInterval(60 * 60 * 24 * 8), price: 115, type: .ermine, weight: 170),
            Cheese(currencyCode: "CZK", date: Date().addingTimeInterval(60 * 60 * 24 * 9), price: 105, type: .standard, weight: 150),
            Cheese(currencyCode: "CZK", date: Date().addingTimeInterval(60 * 60 * 24 * 10), price: 115, type: .ermine, weight: 170)
        ]
    }
    
    func getCheeses(completionHandler: @escaping (Result<[Cheese],Error>) -> Void) {
        DispatchQueue.main.async { [weak self] in
            completionHandler(.success(self?.mockCheeses ?? []))
        }
    }
}
