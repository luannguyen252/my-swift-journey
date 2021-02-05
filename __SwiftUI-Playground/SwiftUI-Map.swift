import SwiftUI
import MapKit
import PlaygroundSupport

struct Location {
    var title: String
    var latitude: Double
    var longitude: Double
}

struct ContentView: View {
    @State var locations = [
        Location(title: "San Francisco", latitude: 37.7749, longitude: -122.4194),
        Location(title: "New York", latitude: 40.7128, longitude: -74.0060)
    ]
    
    var body: some View {
        MapView(locations: locations)
    }
}


struct MapView: UIViewRepresentable {
    @State var locations: [Location]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.mapType = .hybridFlyover
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        for location in locations {
            // Map Pin
            let pin = MKPointAnnotation()
            
            // Set The Coordinates
            pin.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            
            // Set The Title
            pin.title = location.title
            
            // Add To Map
            view.addAnnotation(pin)
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
