//
//  ForecastModel.swift
//  Temperatura
//
//  Created by Glenn Raya on 5/5/20.
//  Copyright © 2020 Glenn Raya. All rights reserved.
//

import Foundation

struct ForecastResponse: Codable {
    var city: City
    var list: [ForecastList]
}

/// 'city' object for the forecast model.
struct City: Codable {
    var name: String?
    var country: String?
    var sunrise: Int?
    var sunset: Int?
    var timezone: Int?
    var coord: Coordinates?
}

/// 'list' object in forecast model.
struct ForecastList: Codable {
    var dt: Int?
    var main: MainForecast?
    var weather: [WeatherForecast]?
    var clouds: Clouds?
    var wind: WindForecast?
    var dt_txt: String?
}

/// 'main' object inside the 'list' object in forecast model.
struct MainForecast: Codable {
    var temp: Double?
    var feels_like: Double?
    var temp_min: Double?
    var temp_max: Double?
    var sea_level: Int?
    var grnd_level: Int?
    var humidity: Int?
}

/// 'weather' array of objects inside the 'list' object in forecast model.
struct WeatherForecast: Codable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

/// 'clouds' object inside the 'list' object in forecast model.
struct Clouds: Codable {
    var clouds: Int?
}


/// 'wind' object inside the 'list' object in forecast model.
struct WindForecast: Codable {
    var speed: Double?
    var deg: Int?
}

/// 'coord' object insde the 'city' object in forecast model.
struct Coordinates: Codable {
    var lat: Double?
    var lon: Double?
}
