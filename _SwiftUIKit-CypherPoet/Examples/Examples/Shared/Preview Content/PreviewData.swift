//
// PreviewData.swift
// Examples
//
// Created by CypherPoet on 8/20/20.
// ✌️
//

#if DEBUG

import Foundation


enum PreviewData {

    enum AppStores {

        static let initial = AppStore(
            initialState: .init(),
            reducer: AppState.defaultReducer,
            middlewareRunners: [
                GalaxiesState.makeMiddleware(),
                AppState.makeLoggingMiddleware(),
            ]
        )
    }
}

#endif
