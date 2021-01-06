//
//  SectionUnitMeasurementView.swift
//  UnitCoverter WatchKit Extension
//
//  Created by Alfian Losari on 14/09/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import SwiftUI

struct SectionUnitMeasurementView: View {
    
    @Binding var unit: MainUnit
    @Binding var unitDimension: Dimension
    var measurementFormatter: MeasurementFormatter
    
    var body: some View {
        Picker(selection: $unitDimension, label: Text("")) {
            ForEach(unit.units) {  (unit: Dimension) in
                Text(self.measurementFormatter.string(from: unit))
                    .tag(unit)
                    .font(.footnote)
                    .multilineTextAlignment(.center)
            }
        }
        .pickerStyle(WheelPickerStyle())
        .frame(height: 100)
    }
}
