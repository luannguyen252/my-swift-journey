//
//  NotificationViewModel.swift
//  WaterMyPlantsWatch Extension
//
//  Created by Toomas Vahter on 25.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import Foundation

struct NotificationViewModel {
    private let plant: Plant
    
    init(plant: Plant) {
        self.plant = plant
    }
    
    var title: String {
        return plant.name
    }
    
    var subtitle: String {
        return NSLocalizedString("NotificationView_Subtitle", comment: "Notification suggestion text")
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "dMMMM", options: 0, locale: .current)
        return formatter
    }()
    
    var lastWatering: String {
        let format = NSLocalizedString("NotificationView_LastWatering", comment: "Last watering date.")
        return String(format: format, dateFormatter.string(from: plant.lastWateringDate))
    }
    
    var nextWatering: String {
        let format = NSLocalizedString("NotificationView_NextWatering", comment: "Next watering date.")
        return String(format: format, dateFormatter.string(from: plant.nextWateringDate))
    }
}
