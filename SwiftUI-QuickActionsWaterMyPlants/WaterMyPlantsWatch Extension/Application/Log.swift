//
//  Log.swift
//  WaterMyPlantsWatch Extension
//
//  Created by Toomas Vahter on 08.02.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import os

extension OSLog {
    static let subsystem = "com.augmentedcode.WaterMyPlants"
    static let phone = OSLog(subsystem: OSLog.subsystem, category: "watch>phone")
}
