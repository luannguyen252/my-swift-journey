//
//  ParkingItem.swift
//  ParkingApp
//
//  Created by Anik on 2/12/20.
//

import Foundation
import MapKit

struct ParkingItem: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let photoName: String
    let place: String
    let carLimit: Int
    let location: CLLocationCoordinate2D
    let fee: CGFloat
    var hour: String
}
