//
// GalaxyServiceError.swift
// Examples
//
// Created by CypherPoet on 8/21/20.
// ✌️
//

import Foundation


enum GalaxyServiceError {
    case unknown
    case networkError
}

extension GalaxyServiceError: Error {}
extension GalaxyServiceError: CaseIterable {}
