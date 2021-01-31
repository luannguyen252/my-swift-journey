//
//  MapWidgetView.swift
//  MapWidget
//
//  Created by Felix Mau on 15.10.20.
//  Copyright © 2020 Felix Mau. All rights reserved.
//

import WidgetKit
import SwiftUI
import CoreLocation

private struct MapUserLocationView: View {
    // MARK: - Config

    private enum Config {
        /// The size of the blue dot reflecting the user location.
        static let userLocationDotSize: CGFloat = 20

        /// If a user-location is older then the given time interval we assume it's outdated and therefore
        /// apply another `foregroundColor` to the dot, reflecting the user-location.
        static let validUserLocationTimeInterval: TimeInterval = 5 * 60
    }

    // MARK: - Public properties

    let mapSnapshot: MapSnapshot

    // MARK: - Private properties

    var circleFillColor: Color {
        mapSnapshot.userLocation.timestamp > Date(timeIntervalSinceNow: -Config.validUserLocationTimeInterval)
            ? .blue
            : .gray
    }

    // MARK: - Render

    var body: some View {
        ZStack {
            mapSnapshot.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            // The map is centered on the user location, therefore we can simply draw the blue dot in the
            // center of our view to simulate the user coordinate.
            Circle()
                .foregroundColor(circleFillColor)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 3)
                )
                .frame(width: Config.userLocationDotSize,
                       height: Config.userLocationDotSize)
        }
    }
}

private struct ErrorView: View {
    // MARK: - Config

    private enum Config {
        /// The color to use as a background in case we have an invalid map image.
        static let fallbackColor = Color(red: 225 / 255,
                                         green: 239 / 255,
                                         blue: 210 / 255)
    }

    // MARK: - Public properties

    let errorMessage: String?

    // MARK: - Render

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Config.fallbackColor
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .font(.footnote)
                    .padding()
            }
        }
    }
}

struct MapWidgetView: View {
    // MARK: - Public properties

    let entry: MapTimelineProvider.Entry

    // MARK: - Render

    var body: some View {
        switch entry.state {
        case let .success(mapSnapshot):
            MapUserLocationView(mapSnapshot: mapSnapshot)

        case let .failure(error):
            ErrorView(errorMessage: error.localizedDescription)

        case .placeholder:
            /// The timeline provider asked for a placeholder synchronously.
            /// Therefore we simply show the `MapErrorView` without a specific `errorMessage`.
            ErrorView(errorMessage: nil)
        }
    }
}

// MARK: - Preview

#if DEBUG
    struct MapWidgetView_Previews: PreviewProvider {
        static var previews: some View {
            let appleParkLocation = CLLocation(latitude: 37.333424329435715, longitude: -122.00546584232792)
            let mapSnapshot = MapSnapshot(userLocation: appleParkLocation,
                                          image: Image("MapApplePark"))

            let mapTimelineEntry = MapTimelineEntry(date: Date(),
                                                    state: .success(mapSnapshot))

            return Group {
                MapWidgetView(entry: mapTimelineEntry)
                    .previewContext(WidgetPreviewContext(family: .systemSmall))

                MapWidgetView(entry: mapTimelineEntry)
                    .previewContext(WidgetPreviewContext(family: .systemMedium))
            }
        }
    }
#endif
