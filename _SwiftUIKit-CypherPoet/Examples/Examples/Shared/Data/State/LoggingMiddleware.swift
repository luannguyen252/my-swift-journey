//
// LoggingMiddleware.swift
// Examples
//
// Created by CypherPoet on 8/21/20.
// ✌️
//

import Foundation
import Combine
import CypherPoetReduxUtils

extension AppState {

    static func makeLoggingMiddleware() -> Middleware<AppState, AppState.Action> {
        return { state, action -> AnyPublisher<AppState.Action, Never>? in
            print("Triggered action: \(action)")

            return Empty().eraseToAnyPublisher()
        }
    }
}
