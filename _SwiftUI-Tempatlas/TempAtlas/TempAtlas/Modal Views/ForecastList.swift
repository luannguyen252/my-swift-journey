import SwiftUI
import MapKit

struct ForecastList : View {
    @EnvironmentObject var state: WeatherState
    @Binding var showModal: Bool
    
    var body: some View {
        VStack {
            Text("Favorites")
                .font(.largeTitle)
                .bold()
                .padding(.top)
            
            List {
                if state.favorites.isEmpty {
                    Text("No Favorites Saved Yet")
                }
                
                ForEach(state.favorites) { favorite in
                    Button(action: {
                        WeatherAPI.shared.getWeatherBy(coordinates: favorite.coordinate.toCoreLocationCoordinate()) { success, responseData in
                            guard success, let data = responseData,
                            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data) else { return }

                            DispatchQueue.main.async {
                                self.state.current = weatherResponse
                                self.state.coordinates = CLLocationCoordinate2D(
                                    latitude: weatherResponse.coordinate.latitude,
                                    longitude: weatherResponse.coordinate.longitude
                                )
                                self.showModal = false
                            }
                        }
                    }) {
                        FavoriteRow(favorite: favorite)
                    }
                }
            }
            .listStyle(GroupedListStyle())
        }
    }
}

#if DEBUG
struct ForecastList_Previews : PreviewProvider {
    static var previews: some View {
        ForecastList(showModal: .constant(true))
            .environmentObject(WeatherState())
        .previewLayout(.sizeThatFits)
    }
}
#endif
