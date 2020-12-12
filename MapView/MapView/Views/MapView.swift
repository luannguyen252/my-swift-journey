//
//  MapView.swift
//  MapView
//
//  Created by Luan Nguyen on 12/12/2020.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    // MARK: - PROPERTIES
    @Binding var manager: CLLocationManager
    @Binding var alert: Bool
    let map = MKMapView()
    
    func makeCoordinator() -> MapView.Coordinator {
        return Coordinator(parent1: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        let center = CLLocationCoordinate2D(latitude: 21.0278, longitude: 105.8342)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
        map.region = region
        manager.requestWhenInUseAuthorization()
        manager.delegate = context.coordinator
        manager.startUpdatingLocation()
        return map
    }

    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {

    }

    // MARK: - SET COORDINATOR
    class Coordinator: NSObject, CLLocationManagerDelegate {
        var parent: MapView

        init(parent1: MapView) {
            parent = parent1
        }

        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            if status == .denied {
                parent.alert.toggle()
            }
        }

        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let location = locations.last
            let point = MKPointAnnotation()
            let georeader = CLGeocoder()

            georeader.reverseGeocodeLocation(location!) { (places, err) in
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                }

                let place = places?.first?.locality
                point.title = place
                point.subtitle = "Current"
                point.coordinate = location!.coordinate
                self.parent.map.removeAnnotations(self.parent.map.annotations)
                self.parent.map.addAnnotation(point)

                let region = MKCoordinateRegion(center: location!.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                self.parent.map.region = region
            }
        }
    }
}

// if user denied location access
// then it must be activated through settings
// but in simulator there is no app settings
// so I'm clearing location and privacy
// its updating live location
