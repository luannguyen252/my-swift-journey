//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

import MapKit

struct Maps_Intro: View {
    @State private var mapCoordinate =
        MKCoordinateRegion(center: CLLocationCoordinate2D(
                            latitude: 40.7608,
                            longitude: -111.8910),
                           span: MKCoordinateSpan(latitudeDelta: 0.1,
                                                  longitudeDelta: 0.1))
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("MapKit",
                       subtitle: "Introduction",
                       desc: "You can use the Map view to show maps in your apps. You bind its starting place to a State variable.",
                       back: .green)
            
            Map(coordinateRegion: $mapCoordinate)
                .ignoresSafeArea(edges: .bottom)
                .padding(.top, -20)
        }
        .font(.title)
    }
}

struct Maps_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Maps_Intro()
    }
}
