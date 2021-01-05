//
//  ForecastViewModel.swift
//  Temperatura
//
//  Created by Glenn Raya on 5/14/20.
//  Copyright © 2020 Glenn Raya. All rights reserved.
//

import Foundation

class ForecastViewModel: ObservableObject {
    private var forecastService: ForecastService!
    @Published var forecastResponse = ForecastResponse.init(city: City(), list: [])
    
    init() {
        self.forecastService = ForecastService()
    }
    
    /// Format the date properly (e.g. Monday, May 11, 2020)
    public func dateFormatter(timeStamp: Int) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: Date(timeIntervalSince1970: TimeInterval(timeStamp)))
    }
    
    /// The the current time in 12-hour format with the right timezone with the am/pm (e.g. 5:52)
    public func getTime(timeStamp: Int) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        formatter.timeZone = TimeZone(secondsFromGMT: self.forecastResponse.city.timezone ?? 0)
        return formatter.string(from: Date(timeIntervalSince1970: TimeInterval(timeStamp)))
    }
    
    /// Get the city name
    var city: String {
        if let city = forecastResponse.city.name {
            return city
        }
        return ""
    }
    
    /// Get the sunrise value
    var sunrise: Int {
        if let sunrise = forecastResponse.city.sunrise {
            return sunrise
        }
        return 0
    }
    
    /// Get the sunset value
    var sunset: Int {
        if let sunset = forecastResponse.city.sunset {
            return sunset
        }
        return 0
    }
    
    /// Get the latitude coordinate.
    var latitude: Double {
        if let latitude = forecastResponse.city.coord?.lat {
            return latitude
        }
        return 0.0
    }
    
    /// Get the longitude coordinate.
    var longitude: Double {
        if let longitude = forecastResponse.city.coord?.lon {
            return longitude
        }
        return 0.0
    }
    
    /// Get the weather condition icon.
    public func getWeatherIcon(icon_name: String) -> String {
        switch icon_name {
            case "01d":
                return "clear_sky_day"
            case "01n":
                return "clear_sky_night"
            case "02d":
                return "few_clouds_day"
            case "02n":
                return "few_clouds_night"
            case "03d":
                return "scattered_clouds"
            case "03n":
                return "scattered_clouds"
            case "04d":
                return "broken_clouds"
            case "04n":
                return "broken_clouds"
            case "09d":
                return "shower_rain"
            case "09n":
                return "shower_rain"
            case "10d":
                return "rain_day"
            case "10n":
                return "rain_night"
            case "11d":
                return "thunderstorm_day"
            case "11n":
                return "thunderstorm_night"
            case "13d":
                return "snow"
            case "13n":
                return "snow"
            case "50d":
                return "mist"
            case "50n":
                return "mist"
            default:
                return "clear_sky_day"
        }
    }
    
    public func reloadForecast() {
        
    }
    
    /// Search for city
    public func search(cityName: String) {
        /// You need to add the 'addingPercentEncoding' property so you can search for cities
        /// with space between words, otherwise it will only work on single word cities.
        print(cityName)
        if let city = cityName.addingPercentEncoding(withAllowedCharacters: .alphanumerics) {
            getForecast(by: city)
        }
    }
    
    public func formatDouble(temp: Double) -> String {
        return String(format: "%.1f", temp)
    }
    
    /// Get the weather forecast by city name
    public func getForecast(by city: String) {
        self.forecastService.getForecast(city: city) { forecast in
            if let forecast = forecast {
                DispatchQueue.main.async {
                    self.forecastResponse = forecast
                }
            }
        }
    }
    
    /// Get the 5 day weather forecast using zip and country code.
    public func getForecastByZip(by zip: String, country_code: String) {
        self.forecastService.getForecastByZipCode(zip: zip, country_code: country_code) { forecast in
            if let forecast = forecast {
                DispatchQueue.main.async {
                    self.forecastResponse = forecast
                    print(self.forecastResponse)
                }
            }
        }
    }
}
