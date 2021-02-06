//
//  LocationService.swift
//  AmbleShot
//
//  Created by myf on 01/11/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import Foundation
import CoreLocation



class LocationService : NSObject, ObservableObject, CLLocationManagerDelegate, Codable {
    @Published var shots: [Shot]
    @Published var running: Bool
   
    private var locationManager : CLLocationManager
    static let filename = "shots.json"
    
    override init() {
        self.shots = []
        self.running = false
        self.locationManager = CLLocationManager()
        
        super.init()
        
        self.setupLocationManager()
    }
    
    enum CodingKeys: String, CodingKey {
           case shots
    }
       
   required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.shots = try values.decode([Shot].self, forKey: .shots)
    
        self.running = false
        self.locationManager = CLLocationManager()
    
        super.init()
    
        self.setupLocationManager()
   }
       
   func encode(to encoder: Encoder) throws {
       var container = encoder.container(keyedBy: CodingKeys.self)
       try container.encode(shots, forKey: .shots)
   }
    
    func setupLocationManager(){
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 100
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.delegate = self
    }
    
    func isAllowedToWorkInBackground() -> Bool{
        if CLLocationManager.locationServicesEnabled() {
            let authStatus = CLLocationManager.authorizationStatus()
            return authStatus == .authorizedAlways || authStatus == .authorizedWhenInUse
        }
        return false
    }
    
    func toggle() {
        if (running) {
            stop()
        }
        else {
            start()
        }
    }
    
    func start() {
        if isAllowedToWorkInBackground() {
            locationManager.startUpdatingLocation()
            running = true
            shots = []
        }
    }
    
    func stop () {
        locationManager.stopUpdatingLocation()
        running = false
    }
    
    /// Location delegate functions
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var newShots:[Shot] = []
        var shotId = self.shots.count
        
        for (index, location) in locations.enumerated() {
            var sameLocation = false
            if let previousShot = self.shots.first { // filtering out duplicate locations
                if (index==0) {
                    let eps = 1e-6
                    let dLat = abs(previousShot.lat-location.coordinate.latitude)
                    let dLng = abs(previousShot.lng-location.coordinate.longitude)
                    sameLocation = (dLat<eps && dLng<eps)
                }
            }
            if (!sameLocation) {
                let shot = Shot(id: shotId, lat: location.coordinate.latitude, lng: location.coordinate.longitude)
                newShots.append(shot)
                shot.loadImage()
                shotId += 1
            }
        }
        
        self.shots.insert(contentsOf: newShots, at: 0)
        self.save()
    }
    
    func loadUnloadedImages() {
        self.shots.filter{ $0.state == .justLocation }.map { $0.loadImage() }
    }
    
    func save() {
        FilesystemHelper.store(self, filename: LocationService.filename)
    }
}
