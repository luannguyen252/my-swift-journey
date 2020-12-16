//
//  ParkingItem.swift
//  ParkingApp
//
//  Created by Luan Nguyen on 16/12/2020.
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
