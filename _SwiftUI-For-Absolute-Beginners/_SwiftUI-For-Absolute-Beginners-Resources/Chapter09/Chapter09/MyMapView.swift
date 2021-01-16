//
//  MyMapView.swift
//  Chapter09
//
//  Created by Jayant Varma on 19/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import UIKit
import SwiftUI
import MapKit

struct MyMapView: UIViewRepresentable {
    typealias MapViewContext = UIViewRepresentableContext<MyMapView>
    
    @Binding var coords: CLLocationCoordinate2D
    
    func makeUIView(context: MapViewContext) -> MKMapView {
        return MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: MapViewContext) {
        let coordinate = CLLocationCoordinate2D(latitude: coords.latitude, longitude: coords.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

//struct MyMapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyMapView()
//    }
//}
