//
//  PlaceFinder.swift
//  TravelApp
//
//  Created by Anik on 25/11/20.
//

import SwiftUI
import MapKit

class PlaceFinder: ObservableObject {
    @Published var spots = Data.places
    @Published var currentIndex = 0 {
        willSet {
            region.center = CLLocationCoordinate2D(
                latitude: spots[newValue].location.latitude - 0.05,
                longitude: spots[newValue].location.longitude)
        }
    }
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Data.places[0].location.latitude, longitude: Data.places[0].location.longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    @Published var selectedPlace: Place?
}
