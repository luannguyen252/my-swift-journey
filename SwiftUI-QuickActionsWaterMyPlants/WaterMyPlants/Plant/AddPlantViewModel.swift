//
//  AddPlantViewModel.swift
//  WaterMyPlants
//
//  Created by Toomas Vahter on 12.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import Combine
import CoreData
import os
import SwiftUI

extension AddPlantView {
    final class ViewModel: ObservableObject {
        private let managedObjectContext: NSManagedObjectContext
        
        init(managedObjectContext: NSManagedObjectContext) {
            self.managedObjectContext = managedObjectContext
        }
        
        @Published var name: String = ""
        
        var canSave: Bool {
            return !name.isEmpty
        }
        
        func save() {
            let plant = Plant.insert(withName: name, into: managedObjectContext)
            // TODO: Add pickers for setting dates
            let lastDayOffset = (-7 ... -1).randomElement()!
            let nextDayOffset = (2...7).randomElement()!
            plant.lastWateringDate = Calendar.autoupdatingCurrent.date(byAdding: .day, value: lastDayOffset, to: Date())!
            plant.nextWateringDate = Calendar.autoupdatingCurrent.date(byAdding: .day, value: nextDayOffset, to: Date())!
            guard managedObjectContext.saveIfNeeded() else { return }
            // os_log(.debug, log: .plants, "added plant with name %s", plant.name)
            os_log(.debug, log: .plants, "added note with name %s", plant.name)
        }
    }
}
