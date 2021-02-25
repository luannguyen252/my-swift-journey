//
//  GenderCard.swift
//  Index
//
//  Created by Pao Yu on 2020-07-31.
//

import SwiftUI

struct UnitCard: View {
    
    @EnvironmentObject var model: IndexModel
    
    var body: some View {
        
        ZStack {
            
            CardBackground()
            
            VStack {
                
                CardLabel(title: "Unit", caption: "Select Unit Type")
                
                Picker("Unit", selection: $model.unit) {
                    Text("Metric").tag(Unit.metric)
                    Text("Imperial").tag(Unit.imperial)
                }   .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 150)
            }
        }   .frame(width: 300, height: 500)
        // End of ZStack
    }
}
