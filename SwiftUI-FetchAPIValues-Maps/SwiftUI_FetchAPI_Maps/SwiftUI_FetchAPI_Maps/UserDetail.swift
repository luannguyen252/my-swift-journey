

import SwiftUI
import MapKit

struct UserDetail: UIViewRepresentable {
    let user: User
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let latitude = (user.address.geo.lat as NSString).integerValue
        let longitude = (user.address.geo.lng as NSString).integerValue

        let coordinate = CLLocationCoordinate2D(
            latitude: Double(latitude), longitude: Double(longitude))
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}
