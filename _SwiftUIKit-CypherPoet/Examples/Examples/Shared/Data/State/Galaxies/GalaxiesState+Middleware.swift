//
// Middleware.swift
// Examples
//
// Created by CypherPoet on 8/21/20.
// ✌️
//

// (Inspired by https://elmprogramming.com/side-effects.html)

import Foundation
import Combine
import CypherPoetReduxUtils


extension GalaxiesState {

    static func makeMiddleware(
        galaxyService: GalaxyServicing = GalaxyService()
    ) -> Middleware<AppState, AppState.Action> {
        return { appState, appAction -> AnyPublisher<AppState.Action, Never>? in
            switch appAction {
            case .galaxies(.findNewGalaxies):
                return galaxyService
                    .findNewGalaxies()
                    .map { AppState.Action.galaxies(.galaxiesFetched($0)) }
                    .catch { error -> Just<AppState.Action> in
                        switch error {
                        case .unknown:
                            return Just(AppState.Action.galaxies(.galaxiesFetchFailed(MiddlewareError.unknown)))
                        case .networkError:
                            return Just(AppState.Action.galaxies(.galaxiesFetchFailed(MiddlewareError.networkError)))
                        }
                    }
                    .eraseToAnyPublisher()
            default:
                return Empty().eraseToAnyPublisher()
            }
        }
    }
}
