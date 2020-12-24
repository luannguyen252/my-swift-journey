//
//  MapView.swift
//  NearMeApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import Foundation
import SwiftUI
import MapKit

// MARK: - COORDINATOR
class Coordinator: NSObject, MKMapViewDelegate {
    var control: MapView
    
    init(_ control: MapView) {
        self.control = control
    }
    
    // MARK: - MAP VIEW
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    mapView.setRegion(region, animated: true)
                }
            }
        }
    }
}

// MARK: - MAP VIEW
struct MapView: UIViewRepresentable {
    let landmarks: [Landmark]
    
    // MARK: - MAKE MAP VIEW
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    // MARK: - MAKE COORDINATOR
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // MARK: - UPDATE MAP VIEW
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        updateAnnotations(from: uiView)
    }
    
    // MARK: - UPDATE ANNOTATIONS
    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.landmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotations(annotations)
    }
}
