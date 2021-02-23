//
//  WeatherInfo.swift
//  Clima
//
//  Created by mohammad mugish on 29/01/21.
//

import Foundation

// MARK: - Abstracted Data Struct which is what is presented with the UI
struct WeatherInformation : Identifiable, Equatable{
    let id : Int
    let status : String
    var degree : String
    let windSpeed : String
    let atmophericPressure : String
    let humidity : String
    let timeStamp : Int64
    var selected : Bool = false
    var image : String

   
    
}


extension WeatherInformation {
    init(weatherInformation : WeatherInformationDB) {
        id = weatherInformation.id
        status = weatherInformation.status
        degree = weatherInformation.degree
        windSpeed = weatherInformation.windSpeed
        atmophericPressure = weatherInformation.atmophericPressure
        humidity = weatherInformation.humidity
        timeStamp = weatherInformation.timeStamp
        image = weatherInformation.image
    }
}
