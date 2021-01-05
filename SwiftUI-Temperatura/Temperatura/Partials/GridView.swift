//
//  GridView.swift
//  Temperatura
//
//  Created by Glenn Raya on 5/14/20.
//  Copyright © 2020 Glenn Raya. All rights reserved.
//

import SwiftUI

struct GridView: View {
    @EnvironmentObject var weatherData: WeatherViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack(spacing: 15) {
                    WeatherPartials(dataType: "humidity", humidity: weatherData.humidity)
                    WeatherPartials(dataType: "windSpeed", windSpeed: weatherData.wind_speed)
                }
                
                HStack(spacing: 15) {
                    WeatherPartials(dataType: "min_temp", temp_min: weatherData.temp_min)
                    WeatherPartials(dataType: "max_temp", temp_max: weatherData.temp_max)
                }
                
                HStack(spacing: 15) {
                    WeatherPartials(dataType: "sunrise", sunrise: weatherData.sunrise)
                    WeatherPartials(dataType: "sunset", sunset: weatherData.sunset)
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
            .padding(.top, 0)
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView().environmentObject(WeatherViewModel())
    }
}
