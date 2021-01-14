//
// AppState.swift
// Examples
//
// Created by CypherPoet on 8/19/20.
// ✌️
//

import Foundation
import CypherPoetReduxUtils


typealias Reducer = CypherPoetReduxUtils.Reducer


struct AppState {
    var galaxiesState = GalaxiesState()
}


// MARK: - Actions
extension AppState {

    enum Action {
        case galaxies(_ action: GalaxiesState.Action)
    }
}


// MARK: - Default Reducer
extension AppState {

    static let defaultReducer = Reducer<AppState, AppState.Action>(
        reduce: { (appState, appAction) -> Void in
            switch appAction {
            case .galaxies(let action):
                appState.galaxiesState.reducer.reduce(&appState.galaxiesState, action)
            }
        }
    )
}
