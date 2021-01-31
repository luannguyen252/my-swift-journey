//
//  Plant.swift
//  WaterMyPlantsWatch Extension
//
//  Created by Toomas Vahter on 25.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import Foundation

struct Plant: Identifiable, Decodable, DictionaryDecodable {
    let id: String
    let name: String
    let lastWateringDate: Date
    let nextWateringDate: Date
    
    var wateringRatio: Double {
        let current = Date()
        guard current <= nextWateringDate || current >= lastWateringDate else { return 0 }
        let elapsed = current.timeIntervalSince(lastWateringDate)
        let max = nextWateringDate.timeIntervalSince(lastWateringDate)
        return elapsed / max
    }
}
