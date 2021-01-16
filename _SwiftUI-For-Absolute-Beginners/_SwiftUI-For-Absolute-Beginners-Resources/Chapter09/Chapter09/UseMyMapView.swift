//
//  UseMyMapView.swift
//  Chapter09
//
//  Created by Jayant Varma on 19/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI
import MapKit

struct UseMyMapView: View {
    @State private var coords = CLLocationCoordinate2D (latitude: -37.8177131, longitude: 144.9679939)
            var body: some View {
                VStack {
                    MyMapView(coords: $coords)
                }
    }
}

struct UseMyMapView_Previews: PreviewProvider {
    static var previews: some View {
        UseMyMapView()
    }
}
