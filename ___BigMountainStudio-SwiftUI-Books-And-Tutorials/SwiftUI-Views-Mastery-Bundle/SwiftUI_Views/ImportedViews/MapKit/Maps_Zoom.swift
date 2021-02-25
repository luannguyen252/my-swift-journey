//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

import MapKit

struct Maps_Zoom: View {
    @State private var zoom: CGFloat = 15
    @State private var mapCoordinate =
        MKCoordinateRegion(center: CLLocationCoordinate2D(
                            latitude: 40.7608,
                            longitude: -111.8910),
                           span: MKCoordinateSpan(latitudeDelta: 0,
                                                  longitudeDelta: 0))
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("MapKit",
                       subtitle: "Zoom",
                       desc: "Zoom in and out of a map using the span parameter.",
                       back: .green)
            
            Map(coordinateRegion: $mapCoordinate)
                .ignoresSafeArea(edges: .bottom)
                .padding(.top, -20)
            
            Slider(value: $zoom, in: 0.01...50, minimumValueLabel: Image(systemName: "plus.magnifyingglass"),
            maximumValueLabel: Image(systemName: "minus.magnifyingglass"), label: {})
            .padding(.horizontal)
            .accentColor(.green)
            .onChange(of: zoom) { zoomValue in
                mapCoordinate.span.latitudeDelta = CLLocationDegrees(zoomValue)
                mapCoordinate.span.longitudeDelta = CLLocationDegrees(zoomValue)
            }
        }
        .font(.title)
    }
}

struct Maps_Zoom_Previews: PreviewProvider {
    static var previews: some View {
        Maps_Zoom()
    }
}
