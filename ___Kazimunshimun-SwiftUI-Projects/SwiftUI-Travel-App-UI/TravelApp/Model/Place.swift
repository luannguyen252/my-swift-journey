//
//  Place.swift
//  TravelApp
//
//  Created by Anik on 25/11/20.
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
