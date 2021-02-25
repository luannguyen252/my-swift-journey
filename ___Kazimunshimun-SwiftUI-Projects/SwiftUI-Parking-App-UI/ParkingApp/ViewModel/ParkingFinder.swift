//
//  ParkingFinder.swift
//  ParkingApp
//
//  Created by Anik on 2/12/20.
//

import SwiftUI
import MapKit

class ParkingFinder: ObservableObject {
    @Published var spots = Data.spots
    @Published var selectedPlace: ParkingItem?
    @Published var showDetail = false
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: Data.spots[0].location.latitude,
            longitude: Data.spots[0].location.longitude),
        span: MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007))
}
