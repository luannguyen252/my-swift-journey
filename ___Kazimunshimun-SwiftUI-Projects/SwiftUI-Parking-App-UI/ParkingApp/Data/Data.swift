//
//  Data.swift
//  ParkingApp
//
//  Created by Anik on 2/12/20.
//

import Foundation
import MapKit

struct Data {
    static let spots = [
        ParkingItem(name: "California Parking", address: "2351 Mission St, San Francisco", photoName: "1", place: "B1", carLimit: 45, location: CLLocationCoordinate2D(latitude: 37.7985599, longitude: -122.4100056), fee: 5.0, hour: "0.0"),
        ParkingItem(name: "Green St Parking", address: "654 Green St, San Francisco", photoName: "2", place: "A6", carLimit: 15, location: CLLocationCoordinate2D(latitude: 37.7993822, longitude: -122.4077079), fee: 3.0, hour: "0.0"),
        ParkingItem(name: "Bank of America", address: "440 Pine St, San Francisco", photoName: "3", place: "B4", carLimit: 20, location: CLLocationCoordinate2D(latitude: 37.799386, longitude: -122.4092267), fee: 4.0, hour: "0.0"),
        ParkingItem(name: "North Beach Parking", address: "701 Stevenson St, San Francisco", photoName: "4", place: "C2", carLimit: 25, location: CLLocationCoordinate2D(latitude: 37.7983406, longitude: -122.4064634), fee: 3.0, hour: "0.0"),
        ParkingItem(name: "Border Parking", address: "1647 Powell St, San Francisco", photoName: "5", place: "A12", carLimit: 12, location: CLLocationCoordinate2D(latitude: 37.7998639, longitude: -122.4110218), fee: 2.0, hour: "0.0"),
        ParkingItem(name: "Public Parking", address: "455 Castro St, San Francisco", photoName: "6", place: "B9", carLimit: 90, location: CLLocationCoordinate2D(latitude: 37.7978987, longitude: -122.4098621), fee: 1.0, hour: "0.0")
    ]
}
