//
//  CovidCountryModel.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 11.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import Foundation

typealias CovidCountryResponse = [CovidCountryResponseModel]
struct CovidCountryResponseModel: Decodable {
    let attributes: CovidCountryModel
}

struct CovidCountryModel: Decodable {
    let id: Int
    let name: String
    let confirmed: Int
    let deaths: Int
    let recovered: Int
    let active: Int
    let latitude: Double?
    let longitude: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "OBJECTID"
        case name = "Country_Region"
        case confirmed = "Confirmed"
        case deaths = "Deaths"
        case recovered = "Recovered"
        case active = "Active"
        case latitude = "Lat"
        case longitude = "Long_"
    }
}
