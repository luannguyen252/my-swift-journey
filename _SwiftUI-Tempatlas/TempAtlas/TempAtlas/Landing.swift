import SwiftUI
import MapKit

struct Landing : View {
    @EnvironmentObject var state: WeatherState
    @State var showModal: Bool = false
    
    var body: some View {
        VStack {
            SearchBar(state: $state.current, coordinate: $state.coordinates)
            MapView(coordinate: $state.coordinates, state: $state.current)
                .padding(.top, -8)
            ControlsView(units: $state.units)
            Divider()
            InfoView()
                .environmentObject(state)
            Divider()
            HStack {
                Button("See All Favorites") {
                   self.showModal = true
                }
                Spacer()
            }
            .padding()
        }.sheet(isPresented: $showModal, content: {
            Modal(displayModal: self.$showModal)
                .environmentObject(self.state)
        })
    }
}

struct Modal: View {
    @EnvironmentObject var currentWeather: WeatherState
    @Binding var displayModal: Bool
    
    var body: some View {
        ForecastList(showModal: $displayModal)
            .environmentObject(self.currentWeather)
    }
}

#if DEBUG
struct Landing_Previews : PreviewProvider {
    static var previews: some View {
        Landing().environmentObject(WeatherState())
    }
}
#endif
