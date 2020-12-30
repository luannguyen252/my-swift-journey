//
//  Log.swift
//  WaterMyPlants
//
//  Created by Toomas Vahter on 12.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import os

extension OSLog {
    static let subsystem = "com.augmentedcode.WaterMyPlants"
    static let plants = OSLog(subsystem: OSLog.subsystem, category: "plants")
    static let watch = OSLog(subsystem: OSLog.subsystem, category: "phone>watch")
}
