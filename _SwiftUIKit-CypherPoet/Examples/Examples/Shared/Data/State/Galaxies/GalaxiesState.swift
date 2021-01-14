//
// GalaxiesState.swift
// Examples
//
// Created by CypherPoet on 8/19/20.
// ✌️
//


import Foundation
import Combine
import CypherPoetReduxUtils


struct GalaxiesState {
    var reducer: Reducer<GalaxiesState, GalaxiesState.Action> = GalaxiesState.defaultReducer

    var currentGalaxy: Galaxy = .milkyWay
    var knownGalaxies: [Galaxy] = []
    var galaxyFetchingError: MiddlewareError?
    var galaxyFetchingState: GalaxyFetchingState = .inactive
}


// MARK: - Actions (Inspired by https://redux.js.org/basics/actions)
extension GalaxiesState {

    enum Action {

        // MARK: -  Actions with Side Effects
        case findNewGalaxies


        // MARK: -  Actions without Side Effects
        case currentGalaxySet(Galaxy)
        case galaxiesFetched([Galaxy])
        case galaxiesFetchFailed(MiddlewareError)
        case fetchingErrorDismissed
    }
}


// MARK: - Default Reducer
extension GalaxiesState {

    static let defaultReducer = Reducer<GalaxiesState, GalaxiesState.Action>(
        reduce: { state, action in
            switch action {
            case .currentGalaxySet(let galaxy):
                state.currentGalaxy = galaxy
            case .findNewGalaxies:
                state.galaxyFetchingState = .inProgress
            case .galaxiesFetched(let galaxies):
                state.galaxyFetchingState = .inactive
                state.knownGalaxies = galaxies
            case .galaxiesFetchFailed(let error):
                state.galaxyFetchingState = .inactive
                state.galaxyFetchingError = error
            case .fetchingErrorDismissed:
                state.galaxyFetchingError = nil
            }
        }
    )
}

extension GalaxiesState {

    enum GalaxyFetchingState: Equatable {
        case inactive
        case inProgress
    }
}
