import SwiftUI

struct InfoView : View {
    @EnvironmentObject var state: WeatherState
    
    var body: some View {
        VStack {
            if state.hasInfo {
                Text("Forecast")
                    .font(.title)
                    .bold()                    
                InfoRow(label: "Location:", value: state.current!.name)
                InfoRow(label: "Conditions:", value: state.current!.weather[0].main + ", \(state.current!.data.temp)°")
                InfoRow(label: "High:", value: "\(state.current!.data.high)°")
                InfoRow(label: "Low:", value: "\(state.current!.data.low)°")
                InfoRow(label: "Humidity:", value: "\(state.current!.data.humidity)%")
                InfoRow(label: "Wind Speed:", value: "\(state.current!.wind.speed)" + (state.units == WeatherAPI.Units.imperial ? "mph" : "m/s"))
                InfoRow(label: "Cloud Cover:", value: "\(state.current!.clouds.coverage)%")
            
                Button(self.state.isFavorite() ? "Remove from Favorites" : "Save to Favorites") {
                    if self.state.isFavorite() {
                        self.state.removeFavorite()
                    } else {
                        self.state.addFavorite()
                    }
                }
                .padding(.top, 1)
            }
        }
        .padding(.leading).padding(.trailing)
    }
}

#if DEBUG
struct InfoView_Previews : PreviewProvider {
    static var previews: some View {
        InfoView().environmentObject(WeatherState())
            .previewLayout(.sizeThatFits)
    }
}
#endif
