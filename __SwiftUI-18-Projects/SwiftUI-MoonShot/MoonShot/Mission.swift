//
//  Mission.swift
//  MoonShot
//
//  Created by Sandesh on 29/04/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    
    struct CrewRole: Codable  {
        let name: String
        let role: String
    }
    
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    
    var formattedDateString: String {
        if let date = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: date)
        } else {
            return "N/A"
        }
    }
    
    var crews: String {
     return crew.reduce("") { $0 + "\($1.name),"}
    }
}
