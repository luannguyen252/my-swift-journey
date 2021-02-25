//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

class WeatherForecast: ObservableObject {
    @Published var forecast = [Weather]()
    
    struct Weather: Identifiable {
        let id = UUID()
        var day = ""
        var icon = ""
    }
    
    init() {
        forecast = [
            Weather(day: "Sunday", icon: "cloud.snow.fill"),
            Weather(day: "Monday", icon: "sun.min.fill"),
            Weather(day: "Tuesday", icon: "sun.max.fill"),
            Weather(day: "Wednesday", icon: "cloud.sun.fill"),
            Weather(day: "Thursday", icon: "sun.min.fill"),
            Weather(day: "Friday", icon: "cloud.drizzle.fill"),
            Weather(day: "Saturday", icon: "cloud.sleet.fill"),
        ]
    }
    
    func fetchAnotherWeek() {
        // Run this code 1 second later
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            forecast.append(contentsOf: forecast)
        }
    }
}

struct ObservableObject_WhyUse: View {
    @StateObject private var weather = WeatherForecast()
    @State private var showForecast = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 24) {
                    HeaderView("", subtitle: "Why You Use", desc: "You use @ObservedObject to observe changes to the parent's @StateObject.", back: .pink, textColor: .white)
                    Text(weather.forecast[0].day)
                    Image(systemName: weather.forecast[0].icon)
                        .font(.system(size: 120))
                        .foregroundColor(.pink)
                    Button("Show 14-Day Forecast") {
                        showForecast = true
                        weather.fetchAnotherWeek()
                    }
                }
                .font(.largeTitle)
                
                if showForecast {
                    WeatherForecastView(weather: weather, showForecast: $showForecast)
                }
            }
            .navigationTitle("@ObservedObject")
        }
    }
}

struct WeatherForecastView: View {
    @ObservedObject var weather: WeatherForecast
    @Binding var showForecast: Bool
    
    var body: some View {
        VStack {
            List(weather.forecast) { day in
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

struct ObservableObject_WhyUse_Previews: PreviewProvider {
    @StateObject private static var weather = WeatherForecast()
    
    static var previews: some View {
        Group {
            ObservableObject_WhyUse()
            
            WeatherForecastView(weather: weather, showForecast: Binding.constant(true))
            
            WeatherForecastView(weather: WeatherForecast(),
                                showForecast: .constant(true))
        }
    }
}
