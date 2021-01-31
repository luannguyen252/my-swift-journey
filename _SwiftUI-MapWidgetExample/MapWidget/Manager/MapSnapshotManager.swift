//
//  MapSnapshotManager.swift
//  MapWidget
//
//  Created by Felix Mau on 15.10.20.
//  Copyright © 2020 Felix Mau. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI

final class MapSnapshotManager {
    // MARK: - Types

    typealias SnapshotCompletionHandler = (Result<Image, Error>) -> Void

    enum SnapshotError: Error {
        case noSnapshotImage
    }

    // MARK: - Config

    private enum Config {
        /// The coordinate span to use when rendering the map.
        ///
        /// - SeeAlso: https://developer.apple.com/documentation/mapkit/mkcoordinatespan
        static let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.005,
                                                     longitudeDelta: 0.005)
    }

    // MARK: - Public methods

    func snapshot(at centerCoordinate: CLLocationCoordinate2D,
                  completionHandler: @escaping SnapshotCompletionHandler) {
        let coordinateRegion = MKCoordinateRegion(center: centerCoordinate,
                                                  span: Config.coordinateSpan)

        let options = MKMapSnapshotter.Options()
        options.region = coordinateRegion

        MKMapSnapshotter(options: options).start { snapshot, error in
            if let error = error {
                completionHandler(.failure(error))
                return
            }

            guard let snapshot = snapshot else {
                completionHandler(.failure(SnapshotError.noSnapshotImage))
                return
            }

            let image = Image(uiImage: snapshot.image)
            completionHandler(.success(image))
        }
    }
}
