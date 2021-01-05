//
//  ViewModel.swift
//  Weather
//
//  Created by Stephen DeStefano on 8/29/19.
//  Copyright © 2019 Stephen DeStefano. All rights reserved.
//

import Foundation
import Combine


class ViewModel: ObservableObject {
    
    var weatherService: Services!
    
    init() {
        self.weatherService = Services()
    }
    
    var cityName: String = ""
    
    @Published var mainWeather = MainWeatherParams()
    @Published var windWeather = WindWeatherParams()
    @Published var cloudWeather = CloudWeatherParams()
    
    var temperature: String {
        if let temp = self.mainWeather.temp {
            let modifiedString = String(format: "%.0f", temp)
            return modifiedString + "°"
        } else {
            return ""
        }
    }
    
    var humid: String {
        if let humidity = self.mainWeather.humidity {
            let modifiedString = String(format: "%.0f", humidity)
            return modifiedString + "%"
        } else {
            return ""
        }
    }
    
    var press: String {
        if let pressure = self.mainWeather.pressure {
            let modifiedString = String(format: "%.0f", pressure)
            return modifiedString
        } else {
            return ""
        }
    }
    
    var windSpeed: String {
        if let speed = self.windWeather.speed {
            return String(speed)
        } else {
            return ""
        }
    }
    
    var windDirection: String {
        if let direction = self.windWeather.deg {
            return windDirectionFromDegrees(degrees: direction)
        } else {
            return ""
        }
    }
    
    var cloudPercent: String {
        if let cloudiness = self.cloudWeather.all {
            let modifiedString = String(format: "%.0f", cloudiness)
            return modifiedString + "%"
        } else {
            return ""
        }
    }
  
//func to convert wind degrees into wind direction
func windDirectionFromDegrees(degrees: Double) -> String {
    let directions = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
    let i: Int = Int((degrees + 11.25)/22.5)
    return directions[i % 16]
}
    
    //check if the user entered string is allowed
    func cityLookup() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            updateWeatherViews(by: city)
        }
    }

    func updateWeatherViews(by city: String) {
        self.weatherService.getWeatherData(city: city) { (weather, wind, clouds) in
            
            if let weather = weather {
                if let wind = wind {
                    if let cloud = clouds {
                        DispatchQueue.main.async {
                            self.mainWeather = weather
                            self.windWeather = wind
                            self.cloudWeather = cloud
                        }
                    }
                }
            }
        }
    }

}
