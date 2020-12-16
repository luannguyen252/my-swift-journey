//
//  MapView.swift
//  PublicArt
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    // MARK: - PROPERTIES
    var coordinate: CLLocationCoordinate2D
    
    // MARK: - MAKE UI VIEW
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    // MARK: - UPDATE UI VIEW
    func updateUIView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        // Added annotation for PublicArt project
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        view.addAnnotation(annotation)
        
        view.setRegion(region, animated: true)
    }
}

// MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        // Using Artwork object instead of Landmark
        MapView(coordinate: artData[5].coordinate)
    }
}
