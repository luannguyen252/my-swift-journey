//
//  Station.swift
//  Tube Status
//
//  Created by Clarence Ji on 6/19/19.
//  Copyright © 2019 Clarence Ji. All rights reserved.
//

import SwiftUI

struct Station: Hashable, Codable, Identifiable {
    
    var id: String
    var name: String
    var type: String
    
    enum CodingKeys: String, CodingKey {
        case id = "naptanId"
        case name = "commonName"
        case type = "stopType"
    }
    
    var isTubeStation: Bool {
        return type.lowercased() == "naptanmetrostation"
    }
    
    var stationName: String {
        return self.name.replacingOccurrences(of: "Underground Station", with: "").trimmingCharacters(in: [" "])
    }
    
}
