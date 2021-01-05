//
//  MapView.swift
//  Chapter09
//
//  Created by Jayant Varma on 19/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    typealias MapViewContext = UIViewRepresentableContext<MapView>
    
    func makeUIView(context: MapViewContext) -> MKMapView {
        return MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: MapViewContext) {
        let coordinate = CLLocationCoordinate2D(latitude: -37.8177131, longitude: 144.9679939)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}
