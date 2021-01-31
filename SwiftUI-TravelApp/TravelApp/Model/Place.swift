//
//  Place.swift
//  TravelApp
//
//  Created by Luan Nguyen on 17/12/2020.
//

import Foundation
import MapKit

struct Place: Identifiable {
    let id = UUID()
    let index: Int
    let name: String
    let date: String
    let imageName: String
    let location: CLLocationCoordinate2D
    let departureDayLeft: String
    let activities: [Activity]
}
