//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI
import MapKit

struct Maps_Location: View {
    @State private var mapCoordinate =
        MKCoordinateRegion(center: CLLocationCoordinate2D(
                            latitude: 40.7608,
                            longitude: -111.8910),
                           span: MKCoordinateSpan(latitudeDelta: 0.1,
                                                  longitudeDelta: 0.1))
    private let toronto = MKCoordinateRegion(center: CLLocationCoordinate2D(
                                                latitude: 43.6532,
                                                longitude: -79.3832),
                                             span: MKCoordinateSpan(latitudeDelta: 0.1,
                                                                    longitudeDelta: 0.1))
    private let london = MKCoordinateRegion(center: CLLocationCoordinate2D(
                                                latitude: 51.5074,
                                                longitude: -0.1278),
                                            span: MKCoordinateSpan(latitudeDelta: 0.1,
                                                                   longitudeDelta: 0.1))
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("MapKit",
                       subtitle: "Location",
                       desc: "Use the latitude and longitude to set a location using the CLLocationCoordinate2D object.",
                       back: .green)
            HStack(spacing: 20) {
                Button("Go to Toronto") { mapCoordinate = toronto }
                Button("Go to London") { mapCoordinate = london }
            }
            
            Map(coordinateRegion: $mapCoordinate)
                .ignoresSafeArea(edges: .bottom)
        }
        .font(.title)
    }
}

struct Maps_Location_Previews: PreviewProvider {
    static var previews: some View {
        Maps_Location()
    }
}
