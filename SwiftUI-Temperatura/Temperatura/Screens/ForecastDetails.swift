//
//  ForecastDetails.swift
//  Temperatura
//
//  Created by Glenn Raya on 5/15/20.
//  Copyright © 2020 Glenn Raya. All rights reserved.
//

import SwiftUI

struct ForecastDetails: View {
    @ObservedObject var forecastVM = ForecastViewModel()
    var city: String = "City of Balanga"
    var forecast = ForecastList()
    var time: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                VStack(alignment: .trailing) {
                    HStack(alignment: .center) {
//                        AsyncImage(url: URL(string: "\(Constants.weatherIconUrl)\(self.forecast.weather![0].icon ?? "02d")@2x.png")!, placeholder: ActivityIndicator(isAnimating: .constant(true), style: .large))
//                            .frame(width: 82, height: 82)
//                            .aspectRatio(contentMode: .fit)
                        Image("\(self.forecastVM.getWeatherIcon(icon_name: (forecast.weather?[0].icon)!))")
                            .resizable()
                            .frame(width: 82, height: 82)
                            .aspectRatio(contentMode: .fit)
                            .padding(.trailing, 32)
                        Text("\(self.forecastVM.formatDouble(temp: self.forecast.main?.temp ?? 0.0))")
                            .font(.system(size: 72.0, weight: .bold))
                            .bold()
                        Text("°C")
                            .font(.title)
                            .foregroundColor(.secondary)
                    }

                    HStack(spacing: 20.0) {
                        VStack(alignment: .center, spacing: 20.0) {
                            VStack(spacing: 5.0) {
                                Text("Latitude")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                                Text("\(String(format: "%.4f", latitude))")
                            }
                            VStack(spacing: 5.0) {
                                Text("Longitude")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                                Text("\(String(format: "%.4f", longitude))")
                            }
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 5) {
                            Text("\(self.forecast.weather![0].description ?? "")".capitalized)
                                .font(.title)
                            Text("\(self.city)")
                            Text("\(self.forecastVM.dateFormatter(timeStamp: self.forecast.dt!))")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            Text("\(self.time)")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                }
                .padding(.bottom, 30)
                .padding(.horizontal, 16)

                VStack {
                    HStack(spacing: 10) {
                        DetailGrid(icon: "arrow.down", icon_color: Color.green, title: "Min Temp", data_type: "temp_min", data: self.forecast)
                        Divider()
                        DetailGrid(icon: "arrow.up", icon_color: Color.purple, title: "Max Temp", data_type: "temp_max", data: self.forecast)
                    }
                    Divider()
                    HStack(spacing: 10) {
                        DetailGrid(icon: "tornado", icon_color: Color.orange, title: "Wind Speed", data_type: "wind", data: self.forecast)
                        Divider()
                        DetailGrid(icon: "thermometer", icon_color: Color.red, title: "Humidity", data_type: "humidity", data: self.forecast)
                    }
                    Divider()
                    HStack(spacing: 10) {
                        DetailGrid(icon: "heart", icon_color: Color.pink, title: "Feels Like", data_type: "feels_like", data: self.forecast)
                        Divider()
                        DetailGrid(icon: "wind", icon_color: Color.blue, title: "Sea Level", data_type: "sea_level", data: self.forecast)
                    }
                    
                }.padding()
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .onAppear() {
                    print(self.forecast)
            }
        }
    }
}

/// Detail grid cell.
struct DetailGrid: View {
    @ObservedObject var forecastVM = ForecastViewModel()
    var icon: String = ""
    var icon_color: Color = Color.green
    var title: String = "Min Temp"
    var data_type: String = ""
    var data = ForecastList()
    
    var body: some View {
        HStack(spacing: 15.0) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(icon_color)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.secondary)
                HStack {
                    if data_type == "temp_min" {
                        Text("\(self.forecastVM.formatDouble(temp: self.data.main?.temp_min ?? 0.0))")
                            .bold()
                            .lineLimit(1)
                        Text("°C")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    
                    if data_type == "temp_max" {
                        Text("\(self.forecastVM.formatDouble(temp: self.data.main?.temp_max ?? 0.0))")
                            .bold()
                            .lineLimit(1)
                        Text("°C")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    
                    if data_type == "wind" {
                        Text("\(self.forecastVM.formatDouble(temp: self.data.wind?.speed ?? 0.0))")
                            .bold()
                            .lineLimit(1)
                        Text("km/hr")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    
                    if data_type == "humidity" {
                        Text("\(self.data.main?.humidity ?? 0)")
                            .bold()
                            .lineLimit(1)
                        Text("%")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    
                    if data_type == "feels_like" {
                        Text("\(self.forecastVM.formatDouble(temp: self.data.main?.feels_like ?? 0.0))")
                            .bold()
                            .lineLimit(1)
                        Text("°C")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }

                    if data_type == "sea_level" {
                        Text("\(self.data.main?.sea_level ?? 0)")
                            .bold()
                            .lineLimit(1)
                        Text("hPa")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .padding(.vertical, 10)
    }
}

struct ForecastDetails_Previews: PreviewProvider {    
    static var previews: some View {
        ForecastDetails()
    }
}
