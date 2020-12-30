//
//  PlantListFlowCoordinator.swift
//  WaterMyPlants
//
//  Created by Toomas Vahter on 22.05.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import UIKit

final class PlantListFlowCoordinator: ObservableObject {
    let dependencyContainer: DependencyContainer
    
    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
    }
    
    private(set) lazy var plantListViewModel: PlantListView.ViewModel = {
        let context = dependencyContainer.persistentContainer.viewContext
        return PlantListView.ViewModel(managedObjectContext: context)
    }()
    
    func makeAddPlantViewModel() -> AddPlantView.ViewModel {
        let context = dependencyContainer.persistentContainer.viewContext
        return AddPlantView.ViewModel(managedObjectContext: context)
    }
    
    func reloadShortcuts() {
        let context = dependencyContainer.persistentContainer.viewContext
        let plants = Plant.all(in: context).sorted(by: { $0.name < $1.name })
        let items = plants.map({ (plant) -> UIApplicationShortcutItem in
            return UIApplicationShortcutItem(type: UIApplicationShortcutItem.Action.showPlant.rawValue,
                                             localizedTitle: plant.name,
                                             localizedSubtitle: nil,
                                             // icon: UIApplicationShortcutIcon(systemImageName: "leaf.arrow.circlepath"),
                                             icon: UIApplicationShortcutIcon(systemImageName: "note"),
                                             userInfo: ["id": plant.id] as? [String: NSSecureCoding])
        })
        UIApplication.shared.shortcutItems = items
    }
}
