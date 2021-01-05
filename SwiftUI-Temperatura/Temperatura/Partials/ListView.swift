//
//  ListView.swift
//  Temperatura
//
//  Created by Glenn Raya on 5/13/20.
//  Copyright © 2020 Glenn Raya. All rights reserved.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var weatherData: WeatherViewModel
    
    var dataType: String? = "sunrise"
    var humidity: String? = ""
    var windSpeed: String? = ""
    var temp_min: String? = ""
    var temp_max: String? = ""
    var sunrise: String? = "5:55 AM"
    var sunset: String? = ""
    
    var body: some View {
        List {
            DetailRow(icon: "thermometer", icon_color: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), title: "Humidity", data: weatherData.humidity, data_unit: "%")
            DetailRow(icon: "tornado",icon_color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), title: "Wind Speed", data: weatherData.wind_speed, data_unit: "km/hr")
                DetailRow(icon: "arrow.down", icon_color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), title: "Min temp", data: weatherData.temp_min, data_unit: "°C")
            DetailRow(icon: "arrow.up", icon_color: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), title: "Max Temp", data: weatherData.temp_max, data_unit: "°C")
            DetailRow(icon: "sunrise.fill", icon_color: Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)), title: "Sunrise", data: weatherData.sunrise, data_unit: "am")
            DetailRow(icon: "sunset.fill", icon_color: Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)), title: "Sunset", data: weatherData.sunset, data_unit: "pm")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView().environmentObject(WeatherViewModel())
    }
}

struct DetailRow: View {
    var icon: String = ""
    var icon_color: Color = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    var title: String = ""
    var data: String = ""
    var data_unit: String = ""
    
    var body: some View {
        HStack(spacing: 20) {
            ZStack {
                Image(systemName: icon)
                    .font(.system(size: 24, weight: .light))
                    .foregroundColor(icon_color)
                    .imageScale(.medium)
            }
            .frame(width: 24, height: 24)
            
            Text(title)
                .font(.body)
                .foregroundColor(Color.secondary)
            Spacer()
            HStack {
                Text(data).font(.callout).bold()
                Text(data_unit)
                    .font(.footnote)
                    .foregroundColor(Color.secondary)
            }
        }
    }
}
