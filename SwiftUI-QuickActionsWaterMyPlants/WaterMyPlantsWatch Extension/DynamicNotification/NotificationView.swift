//
//  NotificationView.swift
//  WaterMyPlantsWatch Extension
//
//  Created by Toomas Vahter on 25.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import SwiftUI

struct NotificationView: View {
    let viewModel: NotificationViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.title).font(.title)
            Text(viewModel.subtitle).font(.subheadline)
            Divider()
            Text(viewModel.lastWatering).font(.body).multilineTextAlignment(.center)
            Text(viewModel.nextWatering).font(.body).multilineTextAlignment(.center)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        let lastDate = Calendar.autoupdatingCurrent.date(byAdding: .weekOfMonth, value: -1, to: Date())!
        let nextDate = Calendar.autoupdatingCurrent.date(byAdding: .weekOfMonth, value: 1, to: Date())!
        let plant = Plant(id: "id", name: "Aloe", lastWateringDate: lastDate, nextWateringDate: nextDate)
        return NotificationView(viewModel: NotificationViewModel(plant: plant))
    }
}
