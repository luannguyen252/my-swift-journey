//
//  Weather.swift
//  Temperatura
//
//  Created by Glenn Raya on 5/2/20.
//  Copyright © 2020 Glenn Raya. All rights reserved.
//

/// Weather Model
import Foundation

/// The weather response structure.
struct WeatherResponse: Codable {
    let name: String
    let main: Main
    let wind: Wind
}

/// The 'main' weather object in the API response.
struct Main: Codable {
    var temp: Double?
    var humidity: Double?
    var pressure: Double?
}

/// The 'wind' object in the API response.
struct Wind: Codable {
    var speed: Double?
}

/// The 'weather' object in the API response.
struct
