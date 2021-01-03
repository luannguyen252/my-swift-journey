//
//  MyMap.swift
//  CityExplorer
//
//  Created by Luan Nguyen on 03/01/2021.
//

import MapKit
import SwiftUI

struct MyMap: UIViewRepresentable {
    @Binding var showPhotoGrid: Bool
    @Binding var currentRegion: MKCoordinateRegion
    @Binding var currentAnnotation: MKPointAnnotation?
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true

        map.setRegion(currentRegion, animated: true)
        
        let longPress = UILongPressGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.didLongPress(gesture:)))
        longPress.minimumPressDuration = 1.0
        map.addGestureRecognizer(longPress)
        
        context.coordinator.map = map
        
        map.delegate = context.coordinator
        
        return map
    }
    
    func updateUIView(_ map: MKMapView, context: Context) {
        if currentAnnotation != nil {
            map.removeAnnotations(map.annotations)
            map.addAnnotation(currentAnnotation!)
        }
        
        map.setRegion(currentRegion, animated: true)
    }
    
    func makeCoordinator() -> MyMap.Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {
        var parent: MyMap
        var map: MKMapView?
        
        init(_ parent: MyMap) {
            self.parent = parent
        }
        
        @objc func didLongPress(gesture: UITapGestureRecognizer) {
            if gesture.state == UIGestureRecognizer.State.began    {
                let touchedPoint = gesture.location(in: gesture.view)
                guard let touchedCoordinates = map?.convert(touchedPoint, toCoordinateFrom: map) else {return}
                let newAnnotation = MKPointAnnotation()
                newAnnotation.title = "Tap to see photos"
                newAnnotation.coordinate = CLLocationCoordinate2D(latitude: touchedCoordinates.latitude, longitude: touchedCoordinates.longitude)
                parent.currentAnnotation = newAnnotation
                parent.currentRegion = MKCoordinateRegion(center: newAnnotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            } else {
                return
            }
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            parent.showPhotoGrid = true
        }
    }
}
