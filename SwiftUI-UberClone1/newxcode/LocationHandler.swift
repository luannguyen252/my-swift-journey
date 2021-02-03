//
//  LocationHandler.swift
//  newxcode
//
//  Created by Sergey Sevriugin on 11/09/20.
//

import SwiftUI
import Foundation
import CoreLocation

class LocationHandler: NSObject, ObservableObject, CLLocationManagerDelegate {
   
    static var shared = LocationHandler()
    
    var locationManager: CLLocationManager!
    @Published var location: CLLocation?
    
    override init() {
        super.init()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
    
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        
        switch status {
            
        case .notDetermined:
            
            print("DEBUG: LH.enableLocationSevices: not determined")
            manager.requestWhenInUseAuthorization()
            
        case .restricted, .denied:
            
            print("DEBUG: LH.enableLocationSevices: restricted or denied")
            
        case .authorizedAlways:
            
            print("DEBUG: LH.enableLocationSevices: authorized always")

        case .authorizedWhenInUse:
            
            print("DEBUG:  LH.enableLocationSevices: authorized when in use")
            manager.requestAlwaysAuthorization()
            
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("DEBUG", "LH.locationManager.didUpdateLocations")
        location = locations.last
    }
    
    
}
