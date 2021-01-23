import SwiftUI
import MapKit
import CoreLocation

struct MapView : UIViewRepresentable {
    @Binding var coordinate: CLLocationCoordinate2D
    @Binding var state: WeatherResponse?
    let locationManager = CLLocationManager()
    let map = MKMapView(frame: .zero)
    
    func makeCoordinator() -> MapView.Coordinator {
        Coordinator(self, currentCoord: $coordinate, currentState: $state)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        map.delegate = context.coordinator
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.didTapOnMap(sender:)))
        map.addGestureRecognizer(tapGesture)
        
        locationManager.delegate = context.coordinator
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        // location used only for default coordinate, not necessary to use app
        // don't handle prompting if rejected
        default:
            break
        }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.startUpdatingLocation()
        
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
        
        switch  CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            break
        default:
            // if not authorized for location, get forecast from the default coordinate
            context.coordinator.getForecast()
        }
    }
    
    class Coordinator: NSObject, MKMapViewDelegate, CLLocationManagerDelegate  {
        var mapView: MapView
        @Binding var selectedCoord: CLLocationCoordinate2D
        @Binding var displayedState: WeatherResponse?
        
        init(_ map: MapView, currentCoord: Binding<CLLocationCoordinate2D>, currentState: Binding<WeatherResponse?>) {
            mapView = map
            _selectedCoord = currentCoord
            _displayedState = currentState
        }
        
        // MARK: Delegate functions
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last, !selectedCoord.areCoordinatesEqualTo(otherCoord: location.coordinate)
                else { return }
            selectedCoord = location.coordinate
            getForecast()
        }
        
        // MARK: Selectors
        @objc func didTapOnMap(sender: UITapGestureRecognizer) {
            let tapLocation = sender.location(in: mapView.map)
            let coordinate = mapView.map.convert(tapLocation, toCoordinateFrom: mapView.map)
            
            selectedCoord = coordinate
            getForecast()
        }
        
        // MARK: Helpers
        func getForecast() { // gets the forecast at the current selected coordinate
            WeatherAPI.shared.getWeatherBy(coordinates: selectedCoord) { success, responseData in
                guard success, let data = responseData,
                    let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data) else { return }
                
                let responseCoord = weatherResponse.coordinate
                let newCoord = CLLocationCoordinate2D(
                    latitude: responseCoord.latitude,
                    longitude: responseCoord.longitude)
                
                DispatchQueue.main.async {
                    self.selectedCoord = newCoord
                    self.displayedState = weatherResponse
                }
            }
        }
    }
}

#if DEBUG
struct MapView_Previews : PreviewProvider {
    static var previews: some View {
        MapView(coordinate: .constant(CLLocationCoordinate2D(latitude: 43.08291577840266, longitude: -77.6772236820356)), state: .constant(nil))
    }
}
#endif
