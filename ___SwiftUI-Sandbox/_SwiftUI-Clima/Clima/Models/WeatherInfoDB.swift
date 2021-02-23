//
//  WeatherInfo.swift
//  Clima
//
//  Created by mohammad mugish on 27/01/21.
//

import Foundation
import RealmSwift

class WeatherInformationDB : Object{
    @objc dynamic var id = 0
    @objc dynamic var status = ""
    @objc dynamic var degree = ""
    @objc dynamic var windSpeed = ""
    @objc dynamic var atmophericPressure = ""
    @objc dynamic var humidity = ""
    @objc dynamic var timeStamp : Int64 = Int64(0.0)
    @objc dynamic var image : String = ""
    
    override class func primaryKey() -> String? {
        "id"
    }
}

