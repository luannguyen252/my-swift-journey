import SwiftUI
import MapKit

struct ContentView: View {
    @State var manager =  CLLocationManager()
    @State var alert: Bool = false
    
    var body: some View {
        MapView(manager: $manager, alert: $alert).edgesIgnoringSafeArea(.all).alert(isPresented: $alert){
            Alert(title: Text("Please enable location services from settings!"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MapView:UIViewRepresentable {
    @Binding var manager: CLLocationManager
    @Binding var alert: Bool
    
    let map = MKMapView()
    
    func makeCoordinator() -> MapView.Coordinator {
        return Coordinator(parent1: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        
        let center = CLLocationCoordinate2D(latitude: 30.7333, longitude: 76.7794)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
        map.region = region
        manager.requestWhenInUseAuthorization()
        manager.delegate = context.coordinator
        manager.startUpdatingLocation()
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
    }
    
    class Coordinator:NSObject,CLLocationManagerDelegate{
        var parent:MapView
        
        init(parent1:MapView) {
            parent = parent1
        }
        
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            switch status {
                case .notDetermined:
                    parent.alert.toggle()
                case .restricted:
                    parent.alert.toggle()
                case .denied:
                    parent.alert.toggle()
                case .authorizedWhenInUse:
                    print("Authorized When In Use")
                case .authorizedAlways:
                    print("Authorized Always")
                default:
                    print("Nothing")
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let location = locations.last
            let point = MKPointAnnotation()
            let GeoReader = CLGeocoder()
            GeoReader.reverseGeocodeLocation(location!) { (places, err) in
                if err != nil {
                    print(err?.localizedDescription)
                    return
                }
                let place = places?.first?.locality
                point.title = place
                point.subtitle = "Current"
                point.coordinate = location!.coordinate
                self.parent.map.removeAnnotations(self.parent.map.annotations)
                self.parent.map.addAnnotation(point)
                let region = MKCoordinateRegion(center: location!.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                self.parent.map.region = region
            }
        }
    }
}
