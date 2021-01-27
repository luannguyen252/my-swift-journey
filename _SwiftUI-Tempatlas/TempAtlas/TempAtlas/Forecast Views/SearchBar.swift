import SwiftUI
import UIKit
import MapKit

struct SearchBar : UIViewRepresentable {
    @Binding var state: WeatherResponse?
    @Binding var coordinate: CLLocationCoordinate2D
    
    func makeCoordinator() -> SearchBar.Coordinator {
        Coordinator(self, currentState: $state, coordinates: $coordinate)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        UISearchBar(frame: .zero)
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.prompt = "Search for a city's current forecast"
        uiView.placeholder = "Enter city name"
        uiView.delegate = context.coordinator
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        var searchBar: SearchBar
        @Binding var state: WeatherResponse?
        @Binding var coordinates: CLLocationCoordinate2D
        
        init(_ bar: SearchBar, currentState: Binding<WeatherResponse?>, coordinates: Binding<CLLocationCoordinate2D>) {
            searchBar = bar 
            _state = currentState
            _coordinates = coordinates
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            guard let searchText = searchBar.text else { return }
            WeatherAPI.shared.getWeatherBy(city: searchText) { success, responseData in
                guard success, let data = responseData,
                    let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data) else { return }
                
                let responseCoord = weatherResponse.coordinate
                let newCoord = CLLocationCoordinate2D(
                    latitude: responseCoord.latitude,
                    longitude: responseCoord.longitude)
                
                DispatchQueue.main.async {
                    self.coordinates = newCoord
                    self.state = weatherResponse
                }
            }
        }
    }
}

#if DEBUG
struct SearchBar_Previews : PreviewProvider {
    static var previews: some View {
        SearchBar(state: .constant(nil), coordinate: .constant(CLLocationCoordinate2D(latitude: 21.028511, longitude: 105.804817)))
    }
}
#endif
