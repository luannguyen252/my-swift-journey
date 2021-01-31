//
//  MapView.swift
//  SwiftUICreatingAndCombiningViews
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - SET COORDINATE MAP REGION
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )

    // MARK: - BODY
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
#endif
