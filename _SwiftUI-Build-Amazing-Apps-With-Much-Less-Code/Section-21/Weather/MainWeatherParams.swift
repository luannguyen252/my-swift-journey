//
//  MainWeatherParams.swift
//  Weather
//
//  Created by Stephen DeStefano on 8/29/19.
//  Copyright © 2019 Stephen DeStefano. All rights reserved.
//

import Foundation


//main weather
struct MainWeather: Decodable {
    var main: MainWeatherParams
}
struct MainWeatherParams: Decodable {
    var temp: Double?
    var humidity: Double?
    var pressure: Double?
}



//wind weather
struct WindWeather: Decodable {
    var wind: WindWeatherParams
}
struct WindWeatherParams: Decodable {
    var speed: Double?
    var deg: Double? //wind direction in degrees
}



//cloud weather
struct CloudWeather: Decodable {
    var clouds: CloudWeatherParams
}
struct CloudWeatherParams: Decodable {
    var all: Double?
}
