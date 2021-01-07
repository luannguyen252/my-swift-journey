//
//  TrackerModel.swift
//  WorkdayTracker
//
//  Created by Oded Golden on 20/09/2020.
//

import Foundation
import MapKit

class TrackerModel: ObservableObject {
        
    @Published var days = [Day]()
    @Published var coordinateRegion : MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 32.106696, longitude: 34.834197),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
}
