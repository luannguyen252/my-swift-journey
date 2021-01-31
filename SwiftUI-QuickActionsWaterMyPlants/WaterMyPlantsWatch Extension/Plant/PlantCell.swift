//
//  PlantCell.swift
//  WaterMyPlantsWatch Extension
//
//  Created by Toomas Vahter on 09.02.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import SwiftUI

struct PlantCell: View {
    let viewModel: PlantCellViewModel
    
    var body: some View {
        VStack(spacing: 4) {
            Text(viewModel.title).font(.headline).multilineTextAlignment(.center)
            Text(viewModel.subtitle).font(.footnote).multilineTextAlignment(.center)
        }.padding(8)
            .frame(minWidth: 0, maxWidth: .greatestFiniteMagnitude)
    }
}

struct PlantCellViewModel {
    let plant: Plant
    
    // MARK: Title
    
    var title: String {
        return plant.name
    }
    
    // MARK: Subtitle
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "dMMMM", options: 0, locale: .current)
        return formatter
    }()
    
    var subtitle: String {
        let format = NSLocalizedString("PlantCellView_NextWatering", comment: "Next watering date.")
        return String(format: format, Self.dateFormatter.string(from: plant.nextWateringDate))
    }
    
    // MARK: Background
    
    var wateringColor: Color {
        return Color(hue: 199.0 / 360.0, saturation: 1.0, brightness: plant.wateringRatio)
    }
}

struct PlantCell_Previews: PreviewProvider {
    static var previews: some View {
        let plant = Plant(id: "1",
                          name: "Aloe",
                          lastWateringDate: Date().addingTimeInterval(-3600 * 24),
                          nextWateringDate: Date().addingTimeInterval(3600 * 24 * 3))
        let viewModel = PlantCellViewModel(plant: plant)
        return PlantCell(viewModel: viewModel)
    }
}
