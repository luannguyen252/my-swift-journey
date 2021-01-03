//
//  LocationManager.swift
//  CityExplorer
//
//  Created by Luan Nguyen on 03/01/2021.
//

import MapKit
import SwiftUI

class LocationManager: ObservableObject {
    // Set current location
    @Published var currentRegion = MKCoordinateRegion(center: CLLocation(latitude: 21.0278, longitude: 105.8342).coordinate, latitudinalMeters: CLLocationDistance(10000), longitudinalMeters: CLLocationDistance(10000))
    
    // User location manager and authorization status
    let userLocationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    
    // Request permission
    func requestPermission() {
        if authorizationStatus == .notDetermined {
            userLocationManager.requestAlwaysAuthorization()
        }
    }
    
    // Initial request permission and current location
    init() {
        requestPermission()
        guard let userLocation = userLocationManager.location?.coordinate else {return}
        currentRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: CLLocationDistance(1000), longitudinalMeters: CLLocationDistance(1000))
    }
    
    // Zoom to the device's location when tap on the corresponding button
    func goToUserLocation() {
        guard let userLocation = userLocationManager.location?.coordinate else {return}
        currentRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: CLLocationDistance(1000), longitudinalMeters: CLLocationDistance(1000))
    }
}
