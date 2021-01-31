//
//  LocationManager.swift
//  MapWidgetExample
//
//  Created by Felix Mau on 16.10.20.
//  Copyright © 2020 Felix Mau. All rights reserved.
//

import CoreLocation

final class LocationManager {
    // MARK: - Dependencies

    private let locationManager = CLLocationManager()

    // MARK: - Public methods

    func requestWhenInUseAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
}
