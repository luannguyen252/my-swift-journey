//
//  LocationManager.swift
//  MapWidget
//
//  Created by Felix Mau on 15.10.20.
//  Copyright © 2020 Felix Mau. All rights reserved.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject {
    // MARK: - Config

    private enum Config {
        /// The type of user activity associated with the location updates.
        static let activityType: CLActivityType = .otherNavigation

        /// The accuracy of the location data we want to receive.
        static let desiredAccuracy = kCLLocationAccuracyNearestTenMeters

        /// The key we use to store the last known user location.
        static let storageKey = "MapWidgetExample.lastKnownUserLocation"
    }

    // MARK: - Types

    typealias RequestLocationCompletionHandler = (Result<CLLocation, Error>) -> Void

    // MARK: - Private properties

    private var requestLocationCompletionHandlers = [RequestLocationCompletionHandler]()

    // MARK: - Dependencies

    private var locationManager: CLLocationManager?
    private let locationStorageManager: LocationStorageManaging

    // MARK: - Initializer

    init(locationStorageManager: LocationStorageManaging) {
        self.locationStorageManager = locationStorageManager

        super.init()

        setupLocationManager()
    }

    // MARK: - Public methods

    func requestLocation(_ completionHandler: @escaping RequestLocationCompletionHandler) {
        requestLocationCompletionHandlers.append(completionHandler)

        guard let locationManager = locationManager else {
            "Expect to have a valid `locationManager` instance at this point!"
                .log(level: .error)

            return
        }

        if locationManager.authorizationStatus.isAuthorized {
            locationManager.requestLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }

    // MARK: - Private properties

    private func setupLocationManager() {
        // We have to explicitly make sure to intialize the location manger on the main thread.
        // This is not happening per default when instantiating the widget.
        DispatchQueue.main.async {
            let locationManager = CLLocationManager()
            self.locationManager = locationManager

            locationManager.activityType = Config.activityType
            locationManager.desiredAccuracy = Config.desiredAccuracy
            locationManager.delegate = self
        }
    }

    private func resolveRequestLocationCompletionHandlers(with result: Result<CLLocation, Error>) {
        requestLocationCompletionHandlers.forEach { $0(result) }
        requestLocationCompletionHandlers.removeAll()
    }
}

// MARK: - CLLocationManagerDelegate

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        guard manager.authorizationStatus.isAuthorized else {
            // Ignore authorization changes where we loose access to location data.
            return
        }

        guard !requestLocationCompletionHandlers.isEmpty else {
            // Ignore changes where we don't have any pending completion handlers.
            return
        }

        locationManager?.requestLocation()
    }

    func locationManager(_: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // We explicitly ask for the `first` location here, as with `requestLocation()` only one location fix is reported to the delegate.
        // https://developer.apple.com/documentation/corelocation/cllocationmanager/1620548-requestlocation
        guard let userLocation = locations.first else {
            return
        }

        locationStorageManager.set(location: userLocation, forKey: Config.storageKey)

        resolveRequestLocationCompletionHandlers(with: .success(userLocation))
    }

    func locationManager(_: CLLocationManager, didFailWithError error: Error) {
        if let locationError = error as? CLError, locationError.code == CLError.Code.locationUnknown {
            // > If the location service is unable to retrieve a location right away, it reports a `CLError.Code.locationUnknown` error and
            // > keeps trying. In such a situation, you can simply ignore the error and wait for a new event.
            // https://developer.apple.com/documentation/corelocation/cllocationmanagerdelegate/1423786-locationmanager
            return
        }

        if let lastKnownUserLocation = locationStorageManager.location(forKey: Config.storageKey) {
            // We've previously resolved a location, and therefore use it as a fallback.
            resolveRequestLocationCompletionHandlers(with: .success(lastKnownUserLocation))
        } else {
            resolveRequestLocationCompletionHandlers(with: .failure(error))
        }
    }
}

// MARK: - Helpers

private extension CLAuthorizationStatus {
    /// Boolean flag whether we're authorized to access location data.
    var isAuthorized: Bool {
        isAny(of: .authorizedAlways, .authorizedWhenInUse)
    }
}
