//
//  PlantListView.swift
//  WaterMyPlantsWatch Extension
//
//  Created by Toomas Vahter on 08.02.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import SwiftUI

struct PlantListView: View {
    @ObservedObject var viewModel: PlantListViewModel
    
    var body: some View {
        VStack {
            List(self.viewModel.plants) { plant in
                PlantCell(viewModel: PlantCellViewModel(plant: plant))
            }
        }.onAppear {
            self.viewModel.refresh()
        }
    }
}

final class PlantListViewModel: ObservableObject {
    private let connectivityProvider: PhoneConnectivityProvider
    
    init(plants: [Plant] = [], connectivityProvider: PhoneConnectivityProvider) {
        self.plants = plants
        self.connectivityProvider = connectivityProvider
        refresh()
    }

    @Published private(set) var plants: [Plant]
    
    func refresh() {
        connectivityProvider.refreshAllPlants { [weak self] (plants) in
            guard let plants = plants else { return }
            self?.plants = plants
        }
    }
}

struct PlantListView_Previews: PreviewProvider {
    static var previews: some View {
        let plants = [
            Plant(id: "1", name: "Name1", lastWateringDate: Date().addingTimeInterval(-3600 * 24), nextWateringDate: Date().addingTimeInterval(3600 * 24 * 3)),
            Plant(id: "2", name: "Name2", lastWateringDate: Date().addingTimeInterval(-3600 * 24 * 2), nextWateringDate: Date().addingTimeInterval(3600 * 24 * 4))
        ]
        let connectivityProvider = PhoneConnectivityProvider()
        let viewModel = PlantListViewModel(plants: plants, connectivityProvider: connectivityProvider)
        return PlantListView(viewModel: viewModel)
    }
}
