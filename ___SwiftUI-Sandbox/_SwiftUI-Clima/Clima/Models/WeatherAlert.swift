//
//  WeatherAlert.swift
//  Clima
//
//  Created by mohammad mugish on 29/01/21.
//

import Foundation
import RealmSwift


class WeatherAlerts : Object{
    @objc dynamic var id = 0
    @objc dynamic var sender_name : String = ""
    @objc dynamic var event : String = ""
    @objc dynamic var start : Int64 = Int64(0.0)
    @objc dynamic var end : Int64 = Int64(0.0)
    @objc dynamic var _description : String =  ""
    
    override class func primaryKey() -> String? {
        "id"
    }
}
