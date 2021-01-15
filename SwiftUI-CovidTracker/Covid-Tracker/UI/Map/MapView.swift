//
//  MapView.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 11.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import SwiftUI
import UIKit
import MapKit

struct MapView: UIViewRepresentable {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Country.entity(), sortDescriptors: [
        NSSortDescriptor(key: "confirmed", ascending: false)
    ]) var countries: FetchedResults<Country>
    private let mapViewDelegate = MapViewDelegate()
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = mapViewDelegate
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let annotations = countries
            .map { CovidAnnotation(country: $0) }
        
        let overlays = countries
            .map {
                MKCircle(
                    center: $0.coordinates,
                    radius: CLLocationDistance(integerLiteral: $0.confirmed)
                )
            }
        
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(annotations)
        
        uiView.removeOverlays(uiView.overlays)
        uiView.addOverlays(overlays)
    }
}
