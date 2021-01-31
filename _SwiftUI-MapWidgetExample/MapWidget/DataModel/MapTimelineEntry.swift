//
//  MapTimelineEntry.swift
//  MapWidget
//
//  Created by Felix Mau on 15.10.20.
//  Copyright © 2020 Felix Mau. All rights reserved.
//

import WidgetKit

struct MapTimelineEntry: TimelineEntry {
    // MARK: - Types

    enum State {
        /// The timeline provider asked for a placeholder.
        case placeholder

        /// We resolved a user-location and successfully created the map-snapshot.
        case success(MapSnapshot)

        /// An error occurred.
        case failure(Error)
    }

    // MARK: - Public properties

    /// The date to display the widget. This property is required by the protocol `TimelineEntry`.
    let date: Date

    /// The current state of our entry.
    let state: State
}
