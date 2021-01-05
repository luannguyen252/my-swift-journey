//
//  Forecast.swift
//  Temperatura
//
//  Created by Glenn Raya on 5/8/20.
//  Copyright © 2020 Glenn Raya. All rights reserved.
//

import SwiftUI

struct Forecast: View {
    @ObservedObject var forecastVM = ForecastViewModel()
    @ObservedObject var weatherVM = WeatherViewModel()
    @ObservedObject var lm = LocationManager()
    
    /// This will cache the weather icon from the openweather api.
    @Environment(\.imageCache) var cache: ImageCache
    
    /// Location details
    var latitude: Double  { return lm.location?.latitude ?? 0 }
    var longitude: Double { return lm.location?.longitude ?? 0 }
    var zip: String { return lm.placemark?.postalCode ?? "2100" }
    var country_code: String { return lm.placemark?.isoCountryCode ?? "PH" }
    var status: String    { return("\(String(describing: lm.status))") }
    
    var body: some View {
        NavigationView {
            List(self.forecastVM.forecastResponse.list, id: \.dt) { forecast in
                
                /// Navigate to the forecast details screen for more details.
                NavigationLink(destination: ForecastDetails(city: self.forecastVM.city + ", " + self.country_code, forecast: forecast, time: self.forecastVM.getTime(timeStamp: forecast.dt!), latitude: self.forecastVM.latitude, longitude: self.forecastVM.longitude)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(self.forecastVM.dateFormatter(timeStamp: forecast.dt!))").font(.footnote)
                            Text("\(self.forecastVM.getTime(timeStamp: forecast.dt!))")
                                .font(.footnote)
                                .foregroundColor(Color.secondary)
                            Text("\(self.forecastVM.city), \(self.country_code)")
                                .font(.footnote).foregroundColor(Color.gray)
                            Text("\(forecast.weather?[0].description ?? "")".capitalized)
                                .font(.caption)
                                .bold()
                                .foregroundColor(Color.blue)
                                .padding(.top, 20)
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            HStack {
                                /// Use the AsyncImage class to load and cache remote images.
//                                AsyncImage(url: URL(string: "\(Constants.weatherIconUrl)\(forecast.weather?[0].icon ?? "02d")@2x.png")!,
//                                   cache: self.cache,
//                                   placeholder: ActivityIndicator(isAnimating: .constant(true), style: .large)
//                                )
//                                    .frame(width: 50, height: 50)
//                                    .aspectRatio(contentMode: .fit)
                                Image("\(self.forecastVM.getWeatherIcon(icon_name: (forecast.weather?[0].icon)!))")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .aspectRatio(contentMode: .fit)
                                Text("\(self.forecastVM.formatDouble(temp: (forecast.main?.temp) ?? 0.0))°C")
                            }
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
            .onAppear() {
                /// When the list view appears, get the weather forecast by zip and country code.
                /// The zip and country code are returned by the location manager.
                self.forecastVM.getForecastByZip(by: self.zip, country_code: self.country_code)
            }
            .navigationBarTitle("Next 5 Days")
            .navigationBarItems(trailing: Button(action: {
                /// Reload the weather forecast.
                self.forecastVM.getForecastByZip(by: self.zip, country_code: self.country_code)
            }) {
                Image(systemName: "arrow.clockwise")
            })
        }
    }
}

struct Forecast_Previews: PreviewProvider {
    static var previews: some View {
        Forecast()
    }
}
