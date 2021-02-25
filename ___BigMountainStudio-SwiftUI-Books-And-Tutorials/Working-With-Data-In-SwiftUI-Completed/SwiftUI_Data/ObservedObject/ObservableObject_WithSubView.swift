//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

class Forecast: ObservableObject {
    @Published var sevenDays = [Weather]()
    
    struct Weather: Identifiable {
        let id = UUID()
        var day = ""
        var icon = ""
    }
    
    init() {
        sevenDays = [
            Weather(day: "Sunday", icon: "cloud.snow.fill"),
            Weather(day: "Monday", icon: "sun.min.fill"),
            Weather(day: "Tuesday", icon: "sun.max.fill"),
            Weather(day: "Wednesday", icon: "cloud.sun.fill"),
            Weather(day: "Thursday", icon: "sun.min.fill"),
            Weather(day: "Friday", icon: "cloud.drizzle.fill"),
            Weather(day: "Saturday", icon: "cloud.sleet.fill"),
        ]
    }
}

struct ObservableObject_WithSubView: View {
    @StateObject private var forecast = Forecast()
    @State private var showForecast = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 24) {
                    HeaderView("", subtitle: "Introduction", desc: "Pass a reference of your @StateObject into a subview that has a type @ObservedObject.", back: .pink, textColor: .white)
                    Text(forecast.sevenDays[0].day)
                    Image(systemName: forecast.sevenDays[0].icon)
                        .font(.system(size: 120))
                        .foregroundColor(.pink)
                    Button("Show 7 Day Forecast") {
                        showForecast = true
                    }
                }
                .font(.largeTitle)
                
                if showForecast {
                    ForecastView(forecast: forecast, showForecast: $showForecast)
                }
            }
            .navigationTitle("@ObservedObject")
        }
    }
}

struct ObservableObject_WithSubView_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObject_WithSubView()
    }
}

struct ForecastView: View {
    var forecast: Forecast
    @Binding var showForecast: Bool
    
    var body: some View {
        VStack {
            List(forecast.sevenDays) { day in
                Label(
                    title: { Text(day.day).font(.title) },
                    icon: {
                        Image(systemName: day.icon).font(.title)
                            .foregroundColor(.pink)
                    })
            }
            Button("Close", action: { showForecast.toggle() })
        }
        .font(.title)
    }
}
