//
//  Repo.swift
//  Clima
//
//  Created by mohammad mugish on 28/01/21.
//

import Foundation
import Combine


class Repo : ObservableObject {
    
    var weatherInfoStore : WeatherInformationStore
    var api_handler : API_Handler
    
    private var cancellables = Set<AnyCancellable>()
    
    init(weatherInfoStore : WeatherInformationStore, api_handler : API_Handler){
        print("Repo Init")
        self.weatherInfoStore = weatherInfoStore
        self.api_handler = api_handler

    }
    
    

    
}
