//
//  MapView.swift
//  newxcode
//
//  Created by Sergey Sevriugin on 10/09/20.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @ObservedObject var locationHandler = LocationHandler.shared
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
        }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        var coordinate = CLLocationCoordinate2D(
                latitude: 34.011286, longitude: -116.166868)
        
        if let location = locationHandler.location {
            coordinate = location.coordinate
        }
        
        let span = MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        uiView.showsUserLocation = true
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
