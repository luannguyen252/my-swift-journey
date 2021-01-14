//
// GalaxiesState+MiddlewareError.swift
// Examples
//
// Created by CypherPoet on 8/21/20.
// ✌️
//

import Foundation


// 📝 Adding this layer is a good way to expose an error interface to the `State`
// types using our middleware.


extension GalaxiesState {
    enum MiddlewareError: String {
        case unknown
        case networkError
    }
}

extension GalaxiesState.MiddlewareError: Identifiable {
    var id: String { self.rawValue }
}

extension GalaxiesState.MiddlewareError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .unknown:
            return "An unknown error occurred while fetching galaxies."
        case .networkError:
            return "A network error occurred while fetching galaxies."
        }
    }
}
