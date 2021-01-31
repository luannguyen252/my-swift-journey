//
//  LocationStorageManager.swift
//  MapWidget
//
//  Created by Felix Mau on 28.11.20.
//  Copyright © 2020 Felix Mau. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationStorageManaging {
    func set(location: CLLocation, forKey key: String)
    func location(forKey key: String) -> CLLocation?
}

/// Based on <https://stackoverflow.com/a/29987303/3532505> and <https://stackoverflow.com/a/27848617/3532505>.
extension UserDefaults: LocationStorageManaging {
    func set(location: CLLocation, forKey key: String) {
        do {
            let encodedLocationData = try NSKeyedArchiver.archivedData(withRootObject: location, requiringSecureCoding: true)
            set(encodedLocationData, forKey: key)
        } catch {
            "Could not store location in user-defaults: \(error.localizedDescription)".log(level: .error)
        }
    }

    func location(forKey key: String) -> CLLocation? {
        guard let decodedLocationData = data(forKey: key) else {
            "Couldn't find location data for key \(key)".log(level: .error)
            return nil
        }

        do {
            return try NSKeyedUnarchiver.unarchivedObject(ofClass: CLLocation.self, from: decodedLocationData)
        } catch {
            "Couldn't decode location: \(error.localizedDescription)".log(level: .error)
            return nil
        }
    }
}
