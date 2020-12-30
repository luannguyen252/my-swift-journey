//
//  PlantListViewModel.swift
//  WaterMyPlants
//
//  Created by Toomas Vahter on 12.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import Combine
import CoreData
import SwiftUI

extension PlantListView {
    final class ViewModel: NSObject, ObservableObject, NSFetchedResultsControllerDelegate {
        private let plantsController: NSFetchedResultsController<Plant>
        
        init(managedObjectContext: NSManagedObjectContext) {
            let sortDescriptors = [NSSortDescriptor(keyPath: \Plant.name, ascending: true)]
            plantsController = Plant.allPlantsController(context: managedObjectContext, sortDescriptors: sortDescriptors)
            super.init()
            plantsController.delegate = self
            do {
                try plantsController.performFetch()
            }
            catch let nserror as NSError {
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
        
        func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
            objectWillChange.send()
        }
        
        var plants: [Plant] {
            return plantsController.fetchedObjects ?? []
        }
        
        @Published var isPresentingAddPlant = false
    }
}
