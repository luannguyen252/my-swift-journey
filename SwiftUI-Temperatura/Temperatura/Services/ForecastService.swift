//
//  ForecastService.swift
//  Temperatura
//
//  Created by Glenn Raya on 5/14/20.
//  Copyright © 2020 Glenn Raya. All rights reserved.
//

import Foundation


class ForecastService {
    /// Get the 5 day weather forecast for a given city.
    func getForecast(city: String, completion: @escaping (ForecastResponse?) -> ()) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=72851dda65e1b81e5af962c62d81ebd5&units=metric") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let forecastResponse = try? JSONDecoder().decode(ForecastResponse.self, from: data)
            
            if let forecastResponse = forecastResponse {
                let forecastData = forecastResponse
                completion(forecastData)
                
            } else {
                completion(nil)
            }
            
        }.resume()
    }
    
    /// Get the 5 day weather forecast using zip and country code.
    func getForecastByZipCode(zip: String, country_code: String, completion: @escaping (ForecastResponse?) -> ()) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?zip=\(zip),\(country_code)&appid=72851dda65e1b81e5af962c62d81ebd5&units=metric") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let forecastResponse = try? JSONDecoder().decode(ForecastResponse.self, from: data)
            
            if let forecastResponse = forecastResponse {
                let forecastData = forecastResponse
                completion(forecastData)
                
            } else {
                completion(nil)
            }
            
        }.resume()
    }
}
